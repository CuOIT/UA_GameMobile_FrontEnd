import fs from 'fs';
import path from 'path';

const mapping = {
  // Day 01
  "The UA Promise Chain Diagram": "day-01-hero-diagram.svg",
  "Funnel alignment comparison chart": "day-01-data-visual.svg",
  // Day 02
  "Puzzle market thesis map mẫu": "day-02-market-thesis-visual.png",
  "Hero visual: thesis chain operating diagram": "day-02-market-thesis-visual.svg",
  // Day 03
  "Motivation map mẫu cho puzzle game": "day-03-motivation-map-visual.svg",
  "Hero visual: motivation-to-proof chain": "day-03-motivation-to-proof-chain.svg",
  // Day 04
  "Funnel leak map mẫu": "day-04-funnel-leak-map.svg",
  "Funnel leak operating diagram": "day-04-funnel-leak-operating-diagram.svg",
  // Day 05
  "Day 5 learning sprint visual": "day-05-learning-sprint-visual.svg",
  "Day 5 budget signal visual": "day-05-budget-signal-visual.svg",
  // Day 06
  "UA selection decision tree": "day-06-hero-diagram.png",
  "UA selection data visual comparison": "day-06-data-visual.svg",
  // Day 07
  "UA hypothesis chain decision diagram": "day-07-hero-diagram.svg",
  "Royal Match public Google Play screenshot": "royal-match.png",
  // Day 08
  "Metric decision map mẫu": "day-08-data-visual.svg",
  "Hero visual: metric funnel decision map": "day-08-hero-diagram.png",
  // Day 09
  "Vanity trap diagnosis tree": "day-09-hero-diagram.png",
  "Acquisition metric trap board": "day-09-data-visual.svg",
  // Day 10 (Swapped)
  "Retention decay curve comparison": "day-10-hero-diagram.png",
  "First session progression funnel": "day-10-data-visual.png",
  // Day 11
  "LTV calculation components": "day-11-hero-diagram.svg",
  "LTV projection scenarios": "day-11-data-visual.svg",
  // Day 12
  "ROAS Windows & Signal Delay Timeline": "day-12-hero-diagram.svg",
  "CPI vs D7 ROAS Decision Matrix": "day-12-data-visual.svg",
  "Rovio Sugar Blast ROAS Delay optimization representational diagram": "day-12-sugar-blast-roas.svg",
  // Day 13
  "Measurement risk map mẫu": "day-13-data-visual.png",
  "Hero visual: attribution confidence ladder": "day-13-hero-diagram.svg",
  // Day 14
  "Decision-backward tracking flow": "day-14-hero-diagram.png",
  "Event coverage heatmap": "day-14-data-visual.png",
  // Day 15
  "Hook motivation operating map": "day-15-data-visual.svg",
  "Hook signal board": "day-15-hero-diagram.svg",
  // Day 16
  "Format selection matrix mẫu": "day-16-data-visual.svg",
  "Operating diagram: chọn format theo độ cần chứng minh": "day-16-hero-diagram.svg",
  // Day 17
  "Creative test matrix mẫu": "day-17-data-visual.svg",
  "Operating diagram: creative test flow": "day-17-hero-diagram.svg",
  // Day 18
  "Operating diagram: đọc store continuity": "day-18-hero-diagram.png",
  "Chart: promise-chain risk": "day-18-data-visual.svg",
  // Day 19
  "Hero visual: teardown decision flow": "day-19-hero-diagram.svg",
  "Competitor pattern confidence grid": "day-19-data-visual.svg",
  // Day 20
  "Hero visual: fatigue decision tree": "day-20-hero-diagram.svg",
  "Weekly cadence board": "day-20-data-visual.svg",
  // Day 21
  "Readiness gate diagram": "day-21-hero-diagram.svg",
  "Creative packet gate scorecard": "day-21-data-visual.svg",
  // Day 22
  "Campaign cell map": "day-22-hero-diagram.svg",
  "Budget per cell compression board": "day-22-data-visual.svg",
  // Day 23
  "Hero visual: sample-size funnel": "day-23-hero-diagram.svg",
  "Data visual: confidence language table": "day-23-data-visual.svg",
  // Day 24
  "Hero visual: report diagnosis map": "day-24-hero-diagram.png",
  "Data visual: call selection table": "day-24-data-visual.svg",
  // Day 25
  "Hero visual: decision rule ladder": "day-25-hero-diagram.svg",
  "Data visual: call matrix": "day-25-data-visual.svg",
  // Day 26
  "Hero visual: SDK risk map": "day-26-hero-diagram.svg",
  "Data visual: event validation board": "day-26-data-visual.svg",
  // Day 27
  "Operating diagram: learning loop sau mỗi test": "day-27-hero-diagram.svg",
  "Evidence strength ladder": "day-27-data-visual.svg",
  // Day 28
  "Operating diagram: weekly UA loop": "day-28-hero-diagram.svg",
  "Capacity board: scope theo bottleneck thật": "day-28-data-visual.svg",
  // Day 29
  "Operating diagram: one-page plan flow": "day-29-hero-diagram.svg",
  "One-page launch readiness board": "day-29-data-visual.svg",
  // Day 30
  "Risk heatmap: chọn blocker thật": "day-30-data-visual.svg",
  "Next-action decision filter": "day-30-hero-diagram.svg",
};

const rows = [];
for (const [placeholder, visual] of Object.entries(mapping)) {
    let day = 0;
    const m = visual.match(/day-(\d+)-/);
    if (m) {
        day = parseInt(m[1], 10);
    } else {
        if (visual === 'royal-match.png') day = 7;
        if (visual === 'candy-crush.png') day = 12;
    }
    rows.push({ placeholder, visual, day });
}

rows.sort((a, b) => {
  if (a.day !== b.day) return a.day - b.day;
  return rows.indexOf(a) - rows.indexOf(b);
});

const usecasesDir = path.join(process.cwd(), 'content', 'assets', 'usecases');
const githubRawBase = "https://raw.githubusercontent.com/CuOIT/UA_GameMobile_FrontEnd/main/content/assets/usecases";

let md = "# Báo Cáo Visual Dành Riêng Cho Gemini Web (XML & Text Description)\n\n";
md += "Tài liệu này chứa mã nguồn XML của các sơ đồ SVG và mô tả chi tiết của các ảnh PNG giúp Gemini Web có thể đọc hiểu toàn bộ cấu trúc hình ảnh mà không cần xem pixel.\n\n";

let stt = 1;

for (const row of rows) {
    md += `## [${stt}] Lesson ${row.day} - ID: ${row.day}.${stt} - ${row.placeholder}\n`;
    md += `- **Tên file:** \`${row.visual}\`\n`;
    md += `- **Link Online:** [Xem ảnh trên GitHub](${githubRawBase}/${row.visual})\n\n`;

    if (row.visual.endsWith('.svg')) {
        const svgPath = path.join(usecasesDir, row.visual);
        if (fs.existsSync(svgPath)) {
            const svgContent = fs.readFileSync(svgPath, 'utf8');
            md += `### Sơ đồ SVG (Mã nguồn XML để Gemini đọc cấu trúc sơ đồ):\n`;
            md += `\`\`\`xml\n${svgContent}\n\`\`\`\n\n`;
        }
    } else {
        md += `### Mô tả chi tiết ảnh PNG:\n`;
        md += `- Đây là hình ảnh minh họa cho khái niệm: **"${row.placeholder}"**.\n`;
        md += `- Kiểu thiết kế: Phong cách tối giản hiện đại (Dark theme), giao diện Dashboard công nghệ với các màu neon phản quang (xanh cyan, tím, lục bảo).\n`;
        md += `- Mục tiêu: Giúp học viên là game developer hình dung trực quan về mối quan hệ dữ liệu hoặc luồng vận hành trong User Acquisition (UA).\n\n`;
    }
    md += `---\n\n`;
    stt++;
}

fs.writeFileSync('C:\\Users\\DPC00212\\.gemini\\antigravity\\brain\\c2fc37b7-dd92-4bfc-b7a2-50bc818843ba\\gemini_web_readable_report.md', md, 'utf8');
console.log("XML readable report updated.");
