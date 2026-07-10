import { readFileSync, writeFileSync, readdirSync } from "fs";
import { join } from "path";

const regex = /```text\r?\n(!\[.*?\]\(content\/assets\/usecases\/.*?\))[\s\S]*?Do not generate final image inside this repo; this placeholder is for a third-party visual pass\.\r?\n```/g;

const lessonsDir = join("content", "lessons");
const files = readdirSync(lessonsDir).filter(f => f.endsWith(".md"));

let replacedCount = 0;

files.forEach(fileName => {
  const file = join(lessonsDir, fileName);
  const content = readFileSync(file, "utf8");
  let modified = false;
  
  const newContent = content.replace(regex, (match, imageLink) => {
    modified = true;
    replacedCount++;
    return imageLink;
  });

  if (modified) {
    writeFileSync(file, newContent, "utf8");
    console.log(`Unpacked visuals in ${file}`);
  }
});

console.log(`Total unpacked visuals: ${replacedCount}`);
