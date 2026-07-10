import { readFileSync, writeFileSync, readdirSync } from "fs";
import { join } from "path";

// This is the mapping based on the exact strings found previously
const mapping = {
  // Day 01
  "The UA Promise Chain Diagram": "day-01-hero-diagram.png",
  "Funnel alignment comparison chart": "day-01-data-visual.png",
  // Day 02
  "Puzzle market thesis map mẫu": "day-02-market-thesis-visual.png",
  "Hero visual: thesis chain operating diagram": "day-02-market-thesis-visual.svg",
  // Day 03
  "Motivation map mẫu cho puzzle game": "day-03-motivation-map-visual.svg",
  "Hero visual: motivation-to-proof chain": "day-03-motivation-map-visual.svg",
  // Day 04
  "Funnel leak map mẫu": "day-04-funnel-visual.png",
  "Funnel leak operating diagram": "day-04-funnel-visual.png",
  // Day 05
  "Day 5 learning sprint visual": "day-05-learning-sprint-visual.svg",
  "Day 5 budget signal visual": "day-05-budget-signal-visual.svg",
  // Day 06
  "UA selection decision tree": "day-06-hero-diagram.png",
  "UA selection data visual comparison": "day-06-data-visual.png",
  // Day 07
  "UA hypothesis chain decision diagram": "day-07-hero-diagram.png",
  "Royal Match public Google Play screenshot": "royal-match.png",
  // Day 08
  "Metric decision map mẫu": "day-08-data-visual.png",
  "Hero visual: metric funnel decision map": "day-08-hero-diagram.png",
  // Day 09
  "Vanity trap diagnosis tree": "day-09-hero-diagram.png",
  "Acquisition metric trap board": "day-09-data-visual.png",
  // Day 10
  "Retention decay curve comparison": "day-10-data-visual.png",
  "First session progression funnel": "day-10-hero-diagram.png",
  // Day 11
  "LTV calculation components": "day-11-hero-diagram.png",
  "LTV projection scenarios": "day-11-data-visual.png",
  // Day 12
  "ROAS Windows & Signal Delay Timeline": "day-12-hero-diagram.png",
  "CPI vs D7 ROAS Decision Matrix": "day-12-data-visual.png",
  "Rovio Sugar Blast ROAS Delay optimization representational diagram": "candy-crush.png",
  // Day 13
  "Measurement risk map mẫu": "day-13-data-visual.png",
  "Hero visual: attribution confidence ladder": "day-13-hero-diagram.png",
  // Day 14
  "Decision-backward tracking flow": "day-14-hero-diagram.png",
  "Event coverage heatmap": "day-14-data-visual.png",
  // Day 15
  "Hook motivation operating map": "day-15-data-visual.png",
  "Hook signal board": "day-15-hero-diagram.png",
  
  // Days 16 - 30 will use standard: day-XX-data-visual.png and day-XX-hero-diagram.png
  // Day 16
  "Format selection matrix mẫu": "day-16-data-visual.png",
  "Operating diagram: chọn format theo độ cần chứng minh": "day-16-hero-diagram.png",
  // Day 17
  "Creative test matrix mẫu": "day-17-data-visual.png",
  "Operating diagram: creative test flow": "day-17-hero-diagram.png",
  // Day 18
  "Operating diagram: đọc store continuity": "day-18-hero-diagram.png",
  "Chart: promise-chain risk": "day-18-data-visual.png",
  // Day 19
  "Hero visual: teardown decision flow": "day-19-hero-diagram.png",
  "Competitor pattern confidence grid": "day-19-data-visual.png",
  // Day 20
  "Hero visual: fatigue decision tree": "day-20-hero-diagram.png",
  "Weekly cadence board": "day-20-data-visual.png",
  // Day 21
  "Readiness gate diagram": "day-21-hero-diagram.png",
  "Creative packet gate scorecard": "day-21-data-visual.png",
  // Day 22
  "Campaign cell map": "day-22-hero-diagram.png",
  "Budget per cell compression board": "day-22-data-visual.png",
  // Day 23
  "Hero visual: sample-size funnel": "day-23-hero-diagram.png",
  "Data visual: confidence language table": "day-23-data-visual.png",
  // Day 24
  "Hero visual: report diagnosis map": "day-24-hero-diagram.png",
  "Data visual: call selection table": "day-24-data-visual.png",
  // Day 25
  "Hero visual: decision rule ladder": "day-25-hero-diagram.png",
  "Data visual: call matrix": "day-25-data-visual.png",
  // Day 26
  "Hero visual: SDK risk map": "day-26-hero-diagram.png",
  "Data visual: event validation board": "day-26-data-visual.png",
  // Day 27
  "Operating diagram: learning loop sau mỗi test": "day-27-hero-diagram.png",
  "Evidence strength ladder": "day-27-data-visual.png",
  // Day 28
  "Operating diagram: weekly UA loop": "day-28-hero-diagram.png",
  "Capacity board: scope theo bottleneck thật": "day-28-data-visual.png",
  // Day 29
  "Operating diagram: one-page plan flow": "day-29-hero-diagram.png",
  "One-page launch readiness board": "day-29-data-visual.png",
  // Day 30
  "Risk heatmap: chọn blocker thật": "day-30-data-visual.png",
  "Next-action decision filter": "day-30-hero-diagram.png",
};

const regex = /\[VISUAL PLACEHOLDER: Third-party image request - (.*?)\]\r?\n?(Do not generate final image inside this repo; this placeholder is for a third-party visual pass\.)?/g;

const lessonsDir = join("content", "lessons");
const files = readdirSync(lessonsDir).filter(f => f.endsWith(".md"));

let replacedCount = 0;

files.forEach(fileName => {
  const file = join(lessonsDir, fileName);
  const content = readFileSync(file, "utf8");
  let modified = false;
  
  const newContent = content.replace(regex, (match, p1) => {
    const rawKey = p1.trim();
    // try to match with regex, ignoring case and some special chars
    const key = Object.keys(mapping).find(k => k.replace(/[^a-zA-Z]/g, '').toLowerCase() === rawKey.replace(/[^a-zA-Z]/g, '').toLowerCase());
    
    if (key && mapping[key]) {
      modified = true;
      replacedCount++;
      return `![${rawKey}](content/assets/usecases/${mapping[key]})`;
    }
    console.log(`Could not find mapping for: ${rawKey}`);
    return match;
  });

  if (modified) {
    writeFileSync(file, newContent, "utf8");
    console.log(`Updated ${file}`);
  }
});

console.log(`Total replacements: ${replacedCount}`);
