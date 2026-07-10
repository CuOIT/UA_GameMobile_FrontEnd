import fs from 'fs';
import path from 'path';

const outDir = path.join(process.cwd(), 'content', 'assets', 'usecases');

const visuals = [
    { file: 'day-24-data-visual.svg', type: 'data', title: 'Call Selection Table', sub: 'Marketing report diagnosis parameters' },
    { file: 'day-25-hero-diagram.svg', type: 'hero', title: 'Decision Rule Ladder', sub: 'Hierarchical rules for decision making' },
    { file: 'day-25-data-visual.svg', type: 'data', title: 'Call Matrix', sub: 'Matrix for marketing calls' },
    { file: 'day-26-hero-diagram.svg', type: 'hero', title: 'SDK Risk Map', sub: 'Mapping potential SDK integration risks' },
    { file: 'day-26-data-visual.svg', type: 'data', title: 'Event Validation Board', sub: 'Dashboard for validating tracked events' },
    { file: 'day-27-hero-diagram.svg', type: 'hero', title: 'Learning Loop', sub: 'Post-test evaluation and learning cycle' },
    { file: 'day-27-data-visual.svg', type: 'data', title: 'Evidence Strength Ladder', sub: 'Scoring the validity of evidence' },
    { file: 'day-28-hero-diagram.svg', type: 'hero', title: 'Weekly UA Loop', sub: 'Operating rhythm for User Acquisition' },
    { file: 'day-28-data-visual.svg', type: 'data', title: 'Capacity Board', sub: 'Scoping work based on actual bottlenecks' },
    { file: 'day-29-hero-diagram.svg', type: 'hero', title: 'One-page Plan Flow', sub: 'Operating diagram for planning' },
    { file: 'day-29-data-visual.svg', type: 'data', title: 'Launch Readiness Board', sub: 'Dashboard to verify launch requirements' },
    { file: 'day-30-hero-diagram.svg', type: 'hero', title: 'Next-action Decision Filter', sub: 'Filtering tasks to find the true blocker' },
    { file: 'day-30-data-visual.svg', type: 'data', title: 'Risk Heatmap', sub: 'Identifying true bottlenecks and risks' }
];

function createSvg(title, subtitle, type) {
    const isHero = type === 'hero';
    const bg = isHero ? '#0f172a' : '#1e1e2f'; // Dark slate vs dark purple
    const accent = isHero ? '#38bdf8' : '#34d399'; // Light blue vs neon green
    
    let svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 500" width="800" height="500">
        <rect width="100%" height="100%" fill="${bg}" rx="16"/>
        <text x="400" y="80" font-family="Arial, sans-serif" font-size="32" font-weight="bold" fill="#ffffff" text-anchor="middle">${title}</text>
        <text x="400" y="120" font-family="Arial, sans-serif" font-size="18" fill="#94a3b8" text-anchor="middle">${subtitle}</text>
    `;

    if (isHero) {
        svg += `
        <defs>
            <marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
                <path d="M0,0 L0,6 L9,3 z" fill="${accent}" />
            </marker>
        </defs>
        <rect x="300" y="180" width="200" height="60" rx="8" fill="#1e293b" stroke="${accent}" stroke-width="2"/>
        <text x="400" y="215" font-family="Arial, sans-serif" font-size="16" fill="#e2e8f0" text-anchor="middle">Input / Trigger</text>
        
        <path d="M 400 240 L 400 280" stroke="${accent}" stroke-width="3" fill="none" marker-end="url(#arrow)"/>
        
        <rect x="150" y="280" width="200" height="60" rx="8" fill="#1e293b" stroke="#f43f5e" stroke-width="2"/>
        <text x="250" y="315" font-family="Arial, sans-serif" font-size="16" fill="#e2e8f0" text-anchor="middle">Evaluate Scenario A</text>

        <rect x="450" y="280" width="200" height="60" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
        <text x="550" y="315" font-family="Arial, sans-serif" font-size="16" fill="#e2e8f0" text-anchor="middle">Evaluate Scenario B</text>

        <path d="M 400 260 L 250 260 L 250 280" stroke="${accent}" stroke-width="3" fill="none" />
        <path d="M 400 260 L 550 260 L 550 280" stroke="${accent}" stroke-width="3" fill="none" />
        `;
    } else {
        svg += `
        <rect x="100" y="180" width="180" height="120" rx="8" fill="#2d3748" stroke="${accent}" stroke-width="2"/>
        <text x="190" y="220" font-family="Arial, sans-serif" font-size="18" fill="#e2e8f0" text-anchor="middle">Metric Focus</text>
        <text x="190" y="250" font-family="Arial, sans-serif" font-size="28" font-weight="bold" fill="${accent}" text-anchor="middle">High</text>

        <rect x="310" y="180" width="180" height="120" rx="8" fill="#2d3748" stroke="#f6ad55" stroke-width="2"/>
        <text x="400" y="220" font-family="Arial, sans-serif" font-size="18" fill="#e2e8f0" text-anchor="middle">Risk Level</text>
        <text x="400" y="250" font-family="Arial, sans-serif" font-size="28" font-weight="bold" fill="#f6ad55" text-anchor="middle">Low</text>

        <rect x="520" y="180" width="180" height="120" rx="8" fill="#2d3748" stroke="#fc8181" stroke-width="2"/>
        <text x="610" y="220" font-family="Arial, sans-serif" font-size="18" fill="#e2e8f0" text-anchor="middle">Status</text>
        <text x="610" y="250" font-family="Arial, sans-serif" font-size="28" font-weight="bold" fill="#fc8181" text-anchor="middle">Active</text>
        
        <rect x="100" y="320" width="600" height="100" rx="8" fill="#2d3748" stroke="#4fd1c5" stroke-width="2"/>
        <text x="400" y="360" font-family="Arial, sans-serif" font-size="20" fill="#e2e8f0" text-anchor="middle">Confidence Score</text>
        <text x="400" y="395" font-family="Arial, sans-serif" font-size="32" font-weight="bold" fill="#4fd1c5" text-anchor="middle">92 / 100</text>
        `;
    }

    svg += `</svg>`;
    return svg;
}

visuals.forEach(vis => {
    const filePath = path.join(outDir, vis.file);
    fs.writeFileSync(filePath, createSvg(vis.title, vis.sub, vis.type), 'utf8');
    console.log(`Generated ${vis.file}`);
});
