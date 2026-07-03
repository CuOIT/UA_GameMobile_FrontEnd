import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const root = process.cwd();
const bump = (process.argv[2] || "patch").toLowerCase();
const note = process.argv.slice(3).join(" ") || "Version bump";
const versionPath = join(root, "content", "version.json");
const appPath = join(root, "app.js");
const htmlPath = join(root, "index.html");

const valid = new Set(["patch", "minor", "major"]);
if (!valid.has(bump)) {
  console.error(`Invalid bump type: ${bump}. Use patch, minor, or major.`);
  process.exit(1);
}

const versionData = JSON.parse(readFileSync(versionPath, "utf8"));
const [major0, minor0, patch0] = String(versionData.appVersion || "1.0.0").split(".").map(Number);
let [major, minor, patch] = [major0, minor0, patch0];
if (bump === "major") {
  major += 1; minor = 0; patch = 0;
} else if (bump === "minor") {
  minor += 1; patch = 0;
} else {
  patch += 1;
}
const nextVersion = `${major}.${minor}.${patch}`;
const updatedAt = new Date().toISOString().slice(0, 10);
const nextVersionData = {
  appVersion: nextVersion,
  contentVersion: nextVersion,
  updatedAt,
  changeLevel: bump,
  notes: note
};
writeFileSync(versionPath, `${JSON.stringify(nextVersionData, null, 2)}\n`, "utf8");

const appText = readFileSync(appPath, "utf8")
  .replace(/const appVersion = ".*?";/, `const appVersion = "${nextVersion}";`)
  .replace(/const contentVersion = .*?;/, "const contentVersion = appVersion;");
writeFileSync(appPath, appText, "utf8");

const htmlText = readFileSync(htmlPath, "utf8")
  .replace(/styles\.css\?v=[^"]+/g, `styles.css?v=${nextVersion}`)
  .replace(/app\.js\?v=[^"]+/g, `app.js?v=${nextVersion}`)
  .replace(/Version [0-9]+\.[0-9]+\.[0-9]+/g, `Version ${nextVersion}`);
writeFileSync(htmlPath, htmlText, "utf8");

console.log(`Bumped version to ${nextVersion} (${bump})`);
console.log(`Note: ${note}`);