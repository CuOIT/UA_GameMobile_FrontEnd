import fs from 'fs';
import path from 'path';

const outDir = path.join(process.cwd(), 'content', 'assets', 'usecases');

function saveSvg(filename, svgContent) {
    fs.writeFileSync(path.join(outDir, filename), svgContent.trim(), 'utf8');
    console.log(`Generated SVG: ${filename}`);
}

function baseSvg(title, subtitle, content, isHero = true) {
    const bg = isHero ? '#0f172a' : '#1e1b4b'; // Slate vs Indigo
    const accent = isHero ? '#38bdf8' : '#34d399'; // Blue vs Emerald
    return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 500" width="800" height="500">
        <rect width="100%" height="100%" fill="${bg}" rx="16"/>
        <text x="400" y="60" font-family="Segoe UI, Arial, sans-serif" font-size="28" font-weight="bold" fill="#ffffff" text-anchor="middle">${title}</text>
        <text x="400" y="95" font-family="Segoe UI, Arial, sans-serif" font-size="16" fill="#94a3b8" text-anchor="middle">${subtitle}</text>
        <defs>
            <marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
                <path d="M0,0 L0,6 L9,3 z" fill="${accent}" />
            </marker>
        </defs>
        ${content}
    </svg>`;
}

// === DAYS 1 - 15 REFINEMENTS ===

// Day 1 Hero: UA Promise Chain Diagram (Fix dính chữ "3. First Session (Delivery)4. Analytics (Loop)")
saveSvg('day-01-hero-diagram.svg', baseSvg(
    'UA Promise Chain Diagram',
    'Aligning marketing promises with gameplay delivery and feedback loops',
    `
    <rect x="40" y="180" width="150" height="80" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="115" y="215" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff" text-anchor="middle">1. Ad Promise</text>
    <text x="115" y="240" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Hook attracts clicks</text>

    <path d="M 190 220 L 220 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="220" y="180" width="150" height="80" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="295" y="215" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff" text-anchor="middle">2. Store Proof</text>
    <text x="295" y="240" font-family="Arial" font-size="11" fill="#e9d5ff" text-anchor="middle">Screenshots match hook</text>

    <path d="M 370 220 L 400 220" stroke="#a855f7" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="400" y="180" width="160" height="80" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="480" y="215" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff" text-anchor="middle">3. First Session</text>
    <text x="480" y="240" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Onboarding delivers promise</text>

    <path d="M 560 220 L 590 220" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="590" y="180" width="170" height="80" rx="8" fill="#1e1b4b" stroke="#10b981" stroke-width="2"/>
    <text x="675" y="215" font-family="Arial" font-size="14" font-weight="bold" fill="#10b981" text-anchor="middle">4. Analytics Loop</text>
    <text x="675" y="240" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Cohort feedback metrics</text>

    <!-- Feedback loop path -->
    <path d="M 675 260 L 675 320 L 115 320 L 115 260" stroke="#10b981" stroke-width="2" stroke-dasharray="4" fill="none" marker-end="url(#arrow)"/>
    <text x="395" y="310" font-family="Arial" font-size="12" fill="#10b981" text-anchor="middle">Adjust hooks and game pacing based on data</text>
    `
));

// Day 1 Data: Funnel alignment comparison chart
saveSvg('day-01-data-visual.svg', baseSvg(
    'Funnel Alignment Matrix',
    'Correlating ad promise, store CVR, and D1 retention signals',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="280" y1="160" x2="280" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="500" y1="160" x2="500" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <text x="180" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Ad Promise CTR</text>
    <text x="390" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Store CVR</text>
    <text x="610" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">D1 Retention Status</text>

    <text x="180" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">High (5% - Creative Fit)</text>
    <text x="390" y="250" font-family="Arial" font-size="14" fill="#34d399" text-anchor="middle">High (30% - Store Aligned)</text>
    <text x="610" y="250" font-family="Arial" font-size="14" fill="#34d399" font-weight="bold" text-anchor="middle">Healthy (40%+)</text>

    <text x="180" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">High (5% - Creative Fit)</text>
    <text x="390" y="310" font-family="Arial" font-size="14" fill="#ef4444" text-anchor="middle">Low (8% - Store Mismatch)</text>
    <text x="610" y="310" font-family="Arial" font-size="14" fill="#ef4444" font-weight="bold" text-anchor="middle">Weak (&lt;20%)</text>

    <text x="180" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Low (1.2% - Weak Hook)</text>
    <text x="390" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">N/A (No volume)</text>
    <text x="610" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">N/A</text>
    `,
    false
));

// Day 2: Market Thesis Map (Right block margin fix)
saveSvg('day-02-market-thesis-visual.svg', baseSvg(
    'Puzzle Market Thesis Map',
    'Mapping mechanic difficulty to target user segments with proper margins',
    `
    <rect x="50" y="160" width="310" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="205" y="195" font-family="Arial" font-size="18" font-weight="bold" fill="#38bdf8" text-anchor="middle">Core Gameplay Mechanic</text>
    <text x="205" y="240" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Tap-to-pour color sorting</text>
    <text x="205" y="280" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Satisfying visual feedback</text>
    <text x="205" y="320" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Low movement limit constraints</text>

    <path d="M 360 280 L 430 280" stroke="#38bdf8" stroke-width="3" fill="none" marker-end="url(#arrow)"/>

    <!-- Right Block: Adjusted position and width to avoid touching borders -->
    <rect x="440" y="160" width="310" height="240" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="595" y="195" font-family="Arial" font-size="18" font-weight="bold" fill="#34d399" text-anchor="middle">Target Audience Thesis</text>
    <text x="595" y="240" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Relaxation / satisfying seekers</text>
    <text x="595" y="280" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Casual gamers wanting low stress</text>
    <text x="595" y="320" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Commuters looking for quick wins</text>
    `
));

// Day 6 Data: Measurement Complexity (Fix high/low labels)
saveSvg('day-06-data-visual.svg', baseSvg(
    'Measurement Complexity Scaling Matrix',
    'Detailing that lower complexity level is easier/safer for soft launches',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="280" y1="160" x2="280" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="480" y1="160" x2="480" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="180" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Complexity Level</text>
    <text x="380" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Integration Overhead</text>
    <text x="600" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Soft-Launch Suitability</text>

    <!-- Level 1 -->
    <text x="180" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Level 1 (Lowest)</text>
    <text x="380" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">1 day SDK setup</text>
    <text x="600" y="250" font-family="Arial" font-size="14" font-weight="bold" fill="#34d399" text-anchor="middle">RECOMMENDED (Safer)</text>

    <!-- Level 3 -->
    <text x="180" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Level 3 (Medium)</text>
    <text x="380" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Custom event tracking loops</text>
    <text x="600" y="310" font-family="Arial" font-size="14" font-weight="bold" fill="#f59e0b" text-anchor="middle">Moderate risk</text>

    <!-- Level 5 -->
    <text x="180" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Level 5 (Highest)</text>
    <text x="380" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Deep MMP attribution routing</text>
    <text x="600" y="370" font-family="Arial" font-size="14" font-weight="bold" fill="#ef4444" text-anchor="middle">Not recommended for D0 test</text>
    `,
    false
));

// Day 7 Hero: Hypothesis Chain (Remove duplicate "CHANNEL (WHERE)" block)
saveSvg('day-07-hero-diagram.svg', baseSvg(
    'UA Hypothesis Chain Decision Diagram',
    'Structure of targeting, creative, and monetization hypotheses',
    `
    <rect x="50" y="180" width="200" height="80" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="150" y="215" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">1. CHANNEL (WHERE)</text>
    <text x="150" y="240" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">Facebook / Google Adwords</text>

    <path d="M 250 220 L 290 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="300" y="180" width="200" height="80" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="215" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">2. CREATIVE (WHAT)</text>
    <text x="400" y="240" font-family="Arial" font-size="12" fill="#e9d5ff" text-anchor="middle">Satisfying puzzle hook variant</text>

    <path d="M 500 220 L 540 220" stroke="#a855f7" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- Fix: Second block is target audience (WHO) instead of duplicate CHANNEL -->
    <rect x="550" y="180" width="200" height="80" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="650" y="215" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">3. AUDIENCE (WHO)</text>
    <text x="650" y="240" font-family="Arial" font-size="12" fill="#a7f3d0" text-anchor="middle">Calming sorting game seekers</text>
    `
));

// Day 8 Data: Metric Decision Map (Fix ARPDAU axis scale upper bound: $100 -> $1.00)
saveSvg('day-08-data-visual.svg', baseSvg(
    'UA Metric Decision Map',
    'Mapping ARPDAU progress from initial launch to optimization ($0.00 - $1.00)',
    `
    <rect x="100" y="160" width="600" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    
    <!-- Y Axis ticks -->
    <line x1="200" y1="180" x2="200" y2="360" stroke="#38bdf8" stroke-width="2"/>
    <line x1="190" y1="180" x2="200" y2="180" stroke="#38bdf8" stroke-width="2"/>
    <text x="180" y="185" font-family="Arial" font-size="12" fill="#ffffff" text-anchor="end">$1.00 (Max Target)</text>
    
    <line x1="190" y1="270" x2="200" y2="270" stroke="#38bdf8" stroke-width="2"/>
    <text x="180" y="275" font-family="Arial" font-size="12" fill="#ffffff" text-anchor="end">$0.50</text>

    <line x1="190" y1="360" x2="200" y2="360" stroke="#38bdf8" stroke-width="2"/>
    <text x="180" y="365" font-family="Arial" font-size="12" fill="#ffffff" text-anchor="end">$0.00</text>

    <!-- Data Bars -->
    <text x="300" y="380" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Day 1 ($0.12)</text>
    <rect x="270" y="338" width="60" height="22" fill="#ef4444"/>

    <text x="450" y="380" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Day 5 ($0.38)</text>
    <rect x="420" y="291" width="60" height="69" fill="#f59e0b"/>

    <text x="600" y="380" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Day 15 ($0.75)</text>
    <rect x="570" y="225" width="60" height="135" fill="#34d399"/>
    `,
    false
));

// Day 9 Data: Acquisition Metric Trap Board (Remove "+33 +13", "+210+" text, align numbers)
saveSvg('day-09-data-visual.svg', baseSvg(
    'Acquisition Funnel Metrics Board',
    'Clean, aligned cohort progression metrics (Impression to Install)',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="280" y1="160" x2="280" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="500" y1="160" x2="500" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="180" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Funnel Stage</text>
    <text x="390" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Cohort Volume</text>
    <text x="610" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Conversion Rate</text>

    <!-- Row 1 -->
    <text x="180" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Total Ad Impressions</text>
    <text x="390" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">100,000</text>
    <text x="610" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">100%</text>

    <!-- Row 2 -->
    <text x="180" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Store Page Clicks</text>
    <text x="390" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">3,500</text>
    <text x="610" y="310" font-family="Arial" font-size="14" fill="#34d399" text-anchor="middle">3.5% (CTR)</text>

    <!-- Row 3 -->
    <text x="180" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Installs</text>
    <text x="390" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">875</text>
    <text x="610" y="370" font-family="Arial" font-size="14" fill="#34d399" text-anchor="middle">25% (CVR)</text>
    `,
    false
));

// Day 11 Hero: LTV Calculation Components (Correct daily active unit consistency, IAP ARPU -> Daily IAP ARPU)
saveSvg('day-11-hero-diagram.svg', baseSvg(
    'LTV Calculation Components',
    'Breaking down daily active user value components in the LTV formula',
    `
    <rect x="50" y="200" width="200" height="90" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="150" y="235" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">Ad ARPDAU</text>
    <text x="150" y="260" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Daily ad rev / active users</text>

    <text x="275" y="250" font-family="Arial" font-size="28" font-weight="bold" fill="#ffffff" text-anchor="middle">+</text>

    <rect x="300" y="200" width="200" height="90" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="235" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">IAP ARPDAU</text>
    <text x="400" y="260" font-family="Arial" font-size="11" fill="#e9d5ff" text-anchor="middle">Daily IAP revenue / active users</text>

    <path d="M 500 245 L 540 245" stroke="#38bdf8" stroke-width="3" fill="none" marker-end="url(#arrow)"/>

    <rect x="550" y="200" width="200" height="90" rx="8" fill="#1e1b4b" stroke="#34d399" stroke-width="2"/>
    <text x="650" y="235" font-family="Arial" font-size="16" font-weight="bold" fill="#34d399" text-anchor="middle">Total ARPDAU</text>
    <text x="650" y="260" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Combined daily revenue rate</text>
    `
));

// Day 11 Data: LTV Projection Scenarios (Fix user LTV scale: $15.8K -> $1.58 per user)
saveSvg('day-11-data-visual.svg', baseSvg(
    'LTV Projection Scenarios',
    'Expected Lifetime Value (LTV) per individual active user cohort ($0.00 - $3.00)',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="260" y1="160" x2="260" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="480" y1="160" x2="480" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="170" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Scenario</text>
    <text x="370" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Active Lifetime Days</text>
    <text x="600" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">LTV Per User</text>

    <!-- Scenario 1 -->
    <text x="170" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Pessimistic Scenario</text>
    <text x="370" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">8 days</text>
    <text x="600" y="250" font-family="Arial" font-size="14" font-weight="bold" fill="#ef4444" text-anchor="middle">$0.28</text>

    <!-- Scenario 2 -->
    <text x="170" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Realistic Scenario</text>
    <text x="370" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">32 days</text>
    <text x="600" y="310" font-family="Arial" font-size="14" font-weight="bold" fill="#f59e0b" text-anchor="middle">$1.12</text>

    <!-- Scenario 3 -->
    <text x="170" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Optimistic Scenario</text>
    <text x="370" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">45 days</text>
    <text x="600" y="370" font-family="Arial" font-size="14" font-weight="bold" fill="#34d399" text-anchor="middle">$1.58</text>
    `,
    false
));

// Day 12 Hero: Timeline (Align 24-48h postback delay properly to Day 1-2 timeline block)
saveSvg('day-12-hero-diagram.svg', baseSvg(
    'SKAN Postback Signal Timeline',
    'Visualizing privacy window delays for iOS UA data tracking',
    `
    <!-- Day 1-2 block -->
    <rect x="80" y="200" width="180" height="100" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="170" y="235" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">Days 1 - 2</text>
    <text x="170" y="260" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">First postback window</text>

    <path d="M 260 250 L 300 250" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- 24-48h delay aligned correctly next to Day 1-2 -->
    <rect x="310" y="200" width="180" height="100" rx="8" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="235" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">24-48h Delay</text>
    <text x="400" y="260" font-family="Arial" font-size="12" fill="#fef08a" text-anchor="middle">Privacy noise added</text>

    <path d="M 490 250 L 530 250" stroke="#f59e0b" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- Day 3-4 block -->
    <rect x="540" y="200" width="180" height="100" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="630" y="235" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">Days 3 - 4</text>
    <text x="630" y="260" font-family="Arial" font-size="12" fill="#a7f3d0" text-anchor="middle">Data is reconciled</text>
    `
));

// Day 12 Data: Matrix (Fix cropped Y axis title)
saveSvg('day-12-data-visual.svg', baseSvg(
    'CPI vs D7 ROAS Decision Matrix',
    'Ad performance decisions based on cost vs revenue threshold indicators',
    `
    <rect x="180" y="160" width="460" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="180" y1="280" x2="640" y2="280" stroke="#38bdf8" stroke-width="2"/>
    <line x1="410" y1="160" x2="410" y2="400" stroke="#38bdf8" stroke-width="2"/>

    <!-- Y Axis Title (Fully aligned and visible) -->
    <text x="120" y="280" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" transform="rotate(-90 120 280)" text-anchor="middle">D7 ROAS Performance</text>

    <!-- Quadrants -->
    <text x="295" y="200" font-family="Arial" font-size="15" font-weight="bold" fill="#ef4444" text-anchor="middle">High CPI / Low ROAS</text>
    <text x="295" y="235" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Verdict: Pause instantly</text>

    <text x="525" y="200" font-family="Arial" font-size="15" font-weight="bold" fill="#f59e0b" text-anchor="middle">Low CPI / Low ROAS</text>
    <text x="525" y="235" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Verdict: Fix placement</text>

    <text x="295" y="320" font-family="Arial" font-size="15" font-weight="bold" fill="#f59e0b" text-anchor="middle">High CPI / High ROAS</text>
    <text x="295" y="355" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Verdict: Optimize bid</text>

    <text x="525" y="320" font-family="Arial" font-size="15" font-weight="bold" fill="#10b981" text-anchor="middle">Low CPI / High ROAS</text>
    <text x="525" y="355" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Verdict: Scale campaign</text>
    `,
    false
));

// === DAYS 16 - 30 REFINEMENTS (PREVIOUSLY DEFINED) ===

// Day 16.1: Format Selection Matrix (Fix typo and spend data)
saveSvg('day-16-data-visual.svg', baseSvg(
    'Format Selection Matrix',
    'Ad format spend efficiency benchmarks',
    `
    <rect x="80" y="160" width="640" height="250" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="240" y1="160" x2="240" y2="410" stroke="#38bdf8" stroke-width="1"/>
    <line x1="400" y1="160" x2="400" y2="410" stroke="#38bdf8" stroke-width="1"/>
    <line x1="560" y1="160" x2="560" y2="410" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="160" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Ad Format</text>
    <text x="320" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Production Cost</text>
    <text x="480" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Total Spend</text>
    <text x="640" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Conversion Rate</text>

    <!-- Row 1 Playable -->
    <text x="160" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Playable Ads</text>
    <text x="320" y="250" font-family="Arial" font-size="14" fill="#a7f3d0" text-anchor="middle">High ($$$)</text>
    <text x="480" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$68,410</text>
    <text x="640" y="250" font-family="Arial" font-size="14" fill="#34d399" text-anchor="middle">4.2%</text>

    <!-- Row 2 Interstitial -->
    <text x="160" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Interstitial Ads</text>
    <text x="320" y="310" font-family="Arial" font-size="14" fill="#fef08a" text-anchor="middle">Medium ($$)</text>
    <text x="480" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$32,150</text>
    <text x="640" y="310" font-family="Arial" font-size="14" fill="#34d399" text-anchor="middle">2.8%</text>

    <!-- Row 3 In-App Overlay -->
    <text x="160" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">In-App Overlay</text>
    <text x="320" y="370" font-family="Arial" font-size="14" fill="#fca5a5" text-anchor="middle">Low ($)</text>
    <text x="480" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$8,940</text>
    <text x="640" y="370" font-family="Arial" font-size="14" fill="#34d399" text-anchor="middle">1.2%</text>
    `,
    false
));

// Day 16.2: Format Decision Flow (Fix logic looping)
saveSvg('day-16-hero-diagram.svg', baseSvg(
    'Format Selection Flowchart',
    'How to choose the ad format based on testing requirements',
    `
    <rect x="280" y="160" width="240" height="60" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="195" font-family="Arial" font-size="16" fill="#ffffff" text-anchor="middle">Analyze Goal</text>

    <path d="M 400 220 L 400 260" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- Split -->
    <rect x="150" y="270" width="220" height="70" rx="8" fill="#1e293b" stroke="#f43f5e" stroke-width="2"/>
    <text x="260" y="300" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Goal: Test Interaction Details</text>
    <text x="260" y="325" font-family="Arial" font-size="12" fill="#f87171" text-anchor="middle">Requires Gameplay Sandbox</text>

    <rect x="430" y="270" width="220" height="70" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="540" y="300" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Goal: Test Broad Appeal</text>
    <text x="540" y="325" font-family="Arial" font-size="12" fill="#34d399" text-anchor="middle">Requires Video Teaser</text>

    <path d="M 400 240 L 260 240 L 260 270" stroke="#38bdf8" stroke-width="2" fill="none"/>
    <path d="M 400 240 L 540 240 L 540 270" stroke="#38bdf8" stroke-width="2" fill="none"/>

    <!-- Actions -->
    <path d="M 260 340 L 260 380" stroke="#f43f5e" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <path d="M 540 340 L 540 380" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="160" y="390" width="200" height="60" rx="8" fill="#1e293b" stroke="#f43f5e" stroke-width="2"/>
    <text x="260" y="425" font-family="Arial" font-size="16" fill="#ffffff" text-anchor="middle">Deploy: Playable Ad</text>

    <rect x="440" y="390" width="200" height="60" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="540" y="425" font-family="Arial" font-size="16" fill="#ffffff" text-anchor="middle">Deploy: Video Ad</text>
    `
));

// Day 17.1: Creative Test Matrix (Remove microtext gibberish)
saveSvg('day-17-data-visual.svg', baseSvg(
    'Creative Testing Matrix',
    'Framework for testing visual hooks and motivation angles',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="240" y1="160" x2="240" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="480" y1="160" x2="480" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="160" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Test Cell ID</text>
    <text x="360" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Hook Angle Description</text>
    <text x="600" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Performance Level</text>

    <!-- Cell A -->
    <text x="160" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Cell A (Relaxation)</text>
    <text x="360" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">ASMR sorting colored sand</text>
    <text x="600" y="250" font-family="Arial" font-size="14" font-weight="bold" fill="#34d399" text-anchor="middle">Top (CTR: 4.8%)</text>

    <!-- Cell B -->
    <text x="160" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Cell B (Challenge)</text>
    <text x="360" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Timed block puzzle grid</text>
    <text x="600" y="310" font-family="Arial" font-size="14" font-weight="bold" fill="#f59e0b" text-anchor="middle">Medium (CTR: 2.1%)</text>

    <!-- Cell C -->
    <text x="160" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Cell C (Control)</text>
    <text x="360" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Generic match-3 gameplay</text>
    <text x="600" y="370" font-family="Arial" font-size="14" font-weight="bold" fill="#ef4444" text-anchor="middle">Low (CTR: 0.9%)</text>
    `,
    false
));

// Day 17.2: Creative Test Flow (Clean loop connections)
saveSvg('day-17-hero-diagram.svg', baseSvg(
    'Creative Testing Workflow',
    'A cycle for validation and deployment of ad creatives',
    `
    <rect x="300" y="140" width="200" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="170" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">1. Build Creative Packet</text>

    <path d="M 400 190 L 400 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="300" y="230" width="200" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="260" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">2. Run Pilot Test (D1-2)</text>

    <path d="M 400 280 L 400 310" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="280" y="320" width="240" height="60" rx="8" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="355" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Evaluate: Is CTR &gt; 2.5%?</text>

    <!-- Branch YES -->
    <path d="M 520 350 L 590 350 L 590 390" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="555" y="340" font-family="Arial" font-size="12" fill="#34d399">YES</text>

    <rect x="490" y="400" width="200" height="50" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="590" y="430" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Scale Budget &amp; Deploy</text>

    <!-- Branch NO -->
    <path d="M 280 350 L 210 350 L 210 390" stroke="#ef4444" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="245" y="340" font-family="Arial" font-size="12" fill="#ef4444">NO</text>

    <rect x="100" y="400" width="200" height="50" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="210" y="430" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Discard &amp; Redesign Hook</text>

    <!-- Loop back to 1 -->
    <path d="M 110 425 L 70 425 L 70 165 L 290 165" stroke="#ef4444" stroke-width="2" stroke-dasharray="4" fill="none" marker-end="url(#arrow)"/>
    `
));

// Day 18.2: Promise-chain Risk (Fix supply chain topic, make it game-marketing related)
saveSvg('day-18-data-visual.svg', baseSvg(
    'Promise-Chain Risk Breakdown',
    'Analyzing risk points in player onboarding and retention loops',
    `
    <!-- Bar Chart -->
    <rect x="100" y="160" width="600" height="260" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    
    <!-- Gridlines -->
    <line x1="250" y1="160" x2="250" y2="420" stroke="#38bdf8" stroke-width="1" stroke-dasharray="4"/>
    <line x1="450" y1="160" x2="450" y2="420" stroke="#38bdf8" stroke-width="1" stroke-dasharray="4"/>

    <!-- Row 1: Ad Creative Hook -->
    <text x="120" y="210" font-family="Arial" font-size="14" fill="#ffffff">1. Ad Creative Hook</text>
    <rect x="300" y="195" width="200" height="25" rx="4" fill="#f43f5e"/>
    <text x="510" y="212" font-family="Arial" font-size="12" fill="#f43f5e" font-weight="bold">High Risk (CTR volatility)</text>

    <!-- Row 2: Storefront proof -->
    <text x="120" y="280" font-family="Arial" font-size="14" fill="#ffffff">2. Storefront Proof</text>
    <rect x="300" y="265" width="120" height="25" rx="4" fill="#f59e0b"/>
    <text x="430" y="282" font-family="Arial" font-size="12" fill="#f59e0b" font-weight="bold">Medium Risk (CVR drop)</text>

    <!-- Row 3: First Session (Tutorial) -->
    <text x="120" y="350" font-family="Arial" font-size="14" fill="#ffffff">3. First Session Tutorial</text>
    <rect x="300" y="335" width="320" height="25" rx="4" fill="#ef4444"/>
    <text x="630" y="352" font-family="Arial" font-size="12" fill="#ef4444" font-weight="bold">Critical (D1 Drop-off)</text>

    <!-- Axis Labels -->
    <text x="300" y="405" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">0%</text>
    <text x="450" y="405" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">50%</text>
    <text x="600" y="405" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">100% Risk</text>
    `,
    false
));

// Day 19.1: Teardown Decision Flow (Fix logic YES/NO branching)
saveSvg('day-19-hero-diagram.svg', baseSvg(
    'Competitor Teardown Decision Flow',
    'Determining if a competitor teardown is worth marketing team resources',
    `
    <rect x="280" y="140" width="240" height="60" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="175" font-family="Arial" font-size="15" fill="#ffffff" text-anchor="middle">Identify Target Competitor</text>

    <path d="M 400 200 L 400 230" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <polygon points="400,230 520,265 400,300 280,265" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="270" font-family="Arial" font-size="12" fill="#ffffff" text-anchor="middle">High Scale &amp; Similar Mech?</text>

    <!-- Branch YES -->
    <path d="M 520 265 L 600 265 L 600 320" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="560" y="250" font-family="Arial" font-size="12" fill="#34d399">YES</text>

    <rect x="500" y="320" width="200" height="60" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="600" y="355" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Execute Full Teardown</text>

    <!-- Branch NO -->
    <path d="M 280 265 L 200 265 L 200 320" stroke="#ef4444" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="240" y="250" font-family="Arial" font-size="12" fill="#ef4444">NO</text>

    <rect x="100" y="320" width="200" height="60" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="200" y="355" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Skip / Monitor Only</text>
    `
));

// Day 19.2: Competitor Pattern Confidence Grid (Fix gibberish microtext)
// Day 19.2: Sensor Tower Competitor Market Share (Mock Sensor Tower Chart)
saveSvg('day-19-data-visual.svg', baseSvg(
    'Sensor Tower Market Share Trends (Puzzle Mobile Genre)',
    'Competitor download share analysis showing market consolidation (Jan - Jun)',
    `
    <!-- Dashboard Header -->
    <rect x="50" y="140" width="700" height="40" rx="4" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="65" y="165" font-family="Arial" font-size="12" fill="#94a3b8">Source: Sensor Tower Store Intelligence  |  Category: Puzzle  |  Region: US iOS + Android</text>

    <!-- Chart Panel -->
    <rect x="80" y="200" width="640" height="200" fill="#1e293b" stroke="#334155" stroke-width="1"/>

    <!-- Area Chart Paths representing stacked market share -->
    <!-- candy crush saga segment (bottom, purple) -->
    <path d="M 80 400 L 200 340 L 320 350 L 440 330 L 560 310 L 720 300 L 720 400 L 80 400 Z" fill="#8b5cf6" opacity="0.8"/>
    
    <!-- royal match segment (middle, gold) -->
    <path d="M 80 340 L 200 280 L 320 250 L 440 210 L 560 180 L 720 160 L 720 300 L 560 310 L 440 330 L 320 350 L 200 340 L 80 400 Z" fill="#f59e0b" opacity="0.85"/>
    
    <!-- merge mansion segment (top, blue) -->
    <path d="M 80 200 L 200 200 L 320 200 L 440 200 L 560 200 L 720 200 L 720 160 L 560 180 L 440 210 L 320 250 L 200 280 L 80 340 Z" fill="#3b82f6" opacity="0.75"/>

    <!-- Grid lines overlay -->
    <line x1="80" y1="200" x2="720" y2="200" stroke="#475569" stroke-dasharray="2" stroke-width="1"/>
    <line x1="80" y1="250" x2="720" y2="250" stroke="#475569" stroke-dasharray="2" stroke-width="1"/>
    <line x1="80" y1="300" x2="720" y2="300" stroke="#475569" stroke-dasharray="2" stroke-width="1"/>
    <line x1="80" y1="350" x2="720" y2="350" stroke="#475569" stroke-dasharray="2" stroke-width="1"/>

    <!-- Labels on segments -->
    <text x="350" y="380" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff">Candy Crush Saga (Steady)</text>
    <text x="450" y="270" font-family="Arial" font-size="12" font-weight="bold" fill="#ffffff">Royal Match (Scale Leader)</text>
    <text x="350" y="225" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff">Merge Mansion (Stable)</text>

    <!-- X-axis Labels (Months) -->
    <text x="80" y="420" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Jan</text>
    <text x="200" y="420" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Feb</text>
    <text x="320" y="420" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Mar</text>
    <text x="440" y="420" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Apr</text>
    <text x="560" y="420" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">May</text>
    <text x="720" y="420" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Jun</text>

    <!-- Footer Note -->
    <text x="400" y="450" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">*Sensor Tower Intelligence data representation. Underlines why competitor copy must match scale power.*</text>
    `,
    false
));

// Day 20.1: Fatigue Decision Tree (Fix spelling errors "DRWWYTDING" etc.)
saveSvg('day-20-hero-diagram.svg', baseSvg(
    'Ad Creative Fatigue Decision Tree',
    'Determining next actions based on CTR / IPM decay metrics',
    `
    <rect x="280" y="140" width="240" height="60" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="175" font-family="Arial" font-size="15" fill="#ffffff" text-anchor="middle">Check Creative Performance</text>

    <path d="M 400 200 L 400 230" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <polygon points="400,230 520,270 400,310 280,270" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="275" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Has CTR Dropped &gt; 30%?</text>

    <!-- Branch YES -->
    <path d="M 520 270 L 600 270 L 600 330" stroke="#ef4444" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="560" y="250" font-family="Arial" font-size="12" fill="#ef4444">YES</text>

    <rect x="500" y="330" width="200" height="70" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="600" y="360" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Rotate Creative / Pause</text>
    <text x="600" y="380" font-family="Arial" font-size="12" fill="#fca5a5" text-anchor="middle">Creative Fatigue Reached</text>

    <!-- Branch NO -->
    <path d="M 280 270 L 200 270 L 200 330" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="240" y="250" font-family="Arial" font-size="12" fill="#34d399">NO</text>

    <rect x="100" y="330" width="200" height="70" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="200" y="360" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Keep Campaign Running</text>
    <text x="200" y="380" font-family="Arial" font-size="12" fill="#a7f3d0" text-anchor="middle">Signal is Stable</text>
    `
));

// Day 20.2: Weekly Cadence Board (Fix general project management layout, make it creative ad cadence specific)
saveSvg('day-20-data-visual.svg', baseSvg(
    'Weekly Creative Ad Cadence Board',
    'Weekly schedule for creative production, testing, and deployment',
    `
    <rect x="60" y="160" width="680" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="60" y1="210" x2="740" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="220" y1="160" x2="220" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="380" y1="160" x2="380" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="560" y1="160" x2="560" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="140" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Monday (Design)</text>
    <text x="300" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Tuesday (Produce)</text>
    <text x="470" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Wednesday-Friday (Test)</text>
    <text x="650" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Weekend (Consolidate)</text>

    <!-- Tasks -->
    <text x="140" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Brainstorm 3 hooks</text>
    <text x="300" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Export 3 ad variations</text>
    <text x="470" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Launch testing campaigns</text>
    <text x="650" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Analyze CTR &amp; IPM</text>

    <text x="140" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Define variants (ASMR/Stress)</text>
    <text x="300" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Setup localization local text</text>
    <text x="470" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Monitor early bounce/exit rate</text>
    <text x="650" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Identify winner creative</text>
    `,
    false
));

// Day 21.1: Readiness Gate Diagram (Fix software-looking pipeline to UA creative gates)
saveSvg('day-21-hero-diagram.svg', baseSvg(
    'UA Creative Readiness Gates',
    'Approval pipeline before deploying ad creatives to production campaigns',
    `
    <rect x="50" y="200" width="140" height="80" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="120" y="235" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">Gate 1: Concept</text>
    <text x="120" y="260" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Hook approved</text>

    <path d="M 190 240 L 220 240" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="220" y="200" width="140" height="80" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="290" y="235" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">Gate 2: Assets</text>
    <text x="290" y="260" font-family="Arial" font-size="11" fill="#e9d5ff" text-anchor="middle">High quality art ready</text>

    <path d="M 360 240 L 390 240" stroke="#a855f7" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="390" y="200" width="140" height="80" rx="8" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="460" y="235" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">Gate 3: QA</text>
    <text x="460" y="260" font-family="Arial" font-size="11" fill="#fef08a" text-anchor="middle">No spelling errors</text>

    <path d="M 530 240 L 560 240" stroke="#f59e0b" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="560" y="200" width="190" height="80" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="655" y="235" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">Gate 4: Store Ready</text>
    <text x="655" y="260" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Matches app store metadata</text>
    `
));

// Day 21.2: Creative Packet Gate Scorecard (Fix math discrepancy: 8/10 completed is 80%)
saveSvg('day-21-data-visual.svg', baseSvg(
    'Creative Packet Gate Scorecard',
    'Evaluation scorecard for a batch of creatives',
    `
    <rect x="100" y="160" width="600" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    
    <text x="140" y="210" font-family="Arial" font-size="18" font-weight="bold" fill="#ffffff">Overall Readiness Score:</text>
    <rect x="420" y="190" width="220" height="30" rx="4" fill="#065f46" stroke="#34d399" stroke-width="1"/>
    <text x="530" y="210" font-family="Arial" font-size="16" font-weight="bold" fill="#34d399" text-anchor="middle">80% Ready (8/10 Passed)</text>

    <!-- Sub-gates -->
    <text x="140" y="260" font-family="Arial" font-size="15" fill="#e2e8f0">- Localization verified in 8 target languages:</text>
    <text x="610" y="260" font-family="Arial" font-size="15" font-weight="bold" fill="#34d399">Passed (8/8)</text>

    <text x="140" y="300" font-family="Arial" font-size="15" fill="#e2e8f0">- Store page visual match proof checked:</text>
    <text x="610" y="300" font-family="Arial" font-size="15" font-weight="bold" fill="#34d399">Passed (2/2)</text>

    <text x="140" y="340" font-family="Arial" font-size="15" fill="#e2e8f0">- Target aspect ratios exported (9:16, 1:1, 16:9):</text>
    <text x="610" y="340" font-family="Arial" font-size="15" font-weight="bold" fill="#f87171">Failed (2/3 exported)</text>
    `,
    false
));

// Day 22.1: Campaign Cell Map (Remove [Oef] brackets and asset placeholder text)
saveSvg('day-22-hero-diagram.svg', baseSvg(
    'Campaign Cell Map Grid',
    'Structure of testing campaign cells and targeting rules',
    `
    <rect x="80" y="160" width="180" height="220" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="170" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Cell 1: US iOS</text>
    <text x="170" y="240" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Target: US Country</text>
    <text x="170" y="280" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Asset: Sort Variant A</text>
    <text x="170" y="320" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Platform: iOS (SKAN)</text>

    <rect x="310" y="160" width="180" height="220" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#a855f7" text-anchor="middle">Cell 2: US Android</text>
    <text x="400" y="240" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Target: US Country</text>
    <text x="400" y="280" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Asset: Sort Variant A</text>
    <text x="400" y="320" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Platform: Android</text>

    <rect x="540" y="160" width="180" height="220" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="630" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#34d399" text-anchor="middle">Cell 3: Tier 2 Broad</text>
    <text x="630" y="240" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Target: Tier 2 Countries</text>
    <text x="630" y="280" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Asset: Sort Variant A</text>
    <text x="630" y="320" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Platform: Android/iOS</text>
    `
));

// Day 22.2: Budget Compression Board (Fix budget scale units: make it consistent $K units)
saveSvg('day-22-data-visual.svg', baseSvg(
    'Budget Compression Board',
    'Ad campaign spend allocation and overage analysis in thousands ($K)',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="220" y1="160" x2="220" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="380" y1="160" x2="380" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="550" y1="160" x2="550" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="150" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Campaign Cell</text>
    <text x="300" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Allocated Budget</text>
    <text x="465" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Actual Spend</text>
    <text x="635" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Overage / Gap</text>

    <!-- US iOS -->
    <text x="150" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">US iOS</text>
    <text x="300" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$10.0K</text>
    <text x="465" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$12.5K</text>
    <text x="635" y="250" font-family="Arial" font-size="14" font-weight="bold" fill="#ef4444" text-anchor="middle">+$2.5K (Scale cap)</text>

    <!-- US Android -->
    <text x="150" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">US Android</text>
    <text x="300" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$10.0K</text>
    <text x="465" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$8.2K</text>
    <text x="635" y="310" font-family="Arial" font-weight="bold" font-size="14" fill="#34d399" text-anchor="middle">-$1.8K (Under spend)</text>

    <!-- Tier 2 Broad -->
    <text x="150" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Tier 2 Broad</text>
    <text x="300" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$5.0K</text>
    <text x="465" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">$5.1K</text>
    <text x="635" y="370" font-family="Arial" font-weight="bold" font-size="14" fill="#34d399" text-anchor="middle">+$0.1K (On target)</text>
    `,
    false
));

// Day 23.1: Sample-Size Funnel (Fix timeline AUX/DER typos)
saveSvg('day-23-hero-diagram.svg', baseSvg(
    'Sample-Size Funnel & Test Timeline',
    'Sufficient data accumulation milestones for statistical validation',
    `
    <rect x="250" y="160" width="300" height="50" rx="4" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="190" font-family="Arial" font-size="15" fill="#ffffff" text-anchor="middle">Day 1-2: 10,000 Impressions (Early CTR)</text>

    <path d="M 400 210 L 400 240" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="220" y="250" width="360" height="50" rx="4" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="280" font-family="Arial" font-size="15" fill="#ffffff" text-anchor="middle">Day 3-5: 500 installs (CVR &amp; CPI Signal)</text>

    <path d="M 400 300 L 400 330" stroke="#a855f7" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="180" y="340" width="440" height="50" rx="4" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="400" y="370" font-family="Arial" font-size="15" fill="#ffffff" text-anchor="middle">Day 7+: 200 Cohort Level-10 completes (Retention &amp; LTV)</text>
    `
));

// Day 23.2: Confidence Language Table (Fix "Mandarin Chlnese" language detector to confidence table)
// Day 23.2: Google Play Console Store Listing Experiment (Mock Play Console)
saveSvg('day-23-data-visual.svg', baseSvg(
    'Google Play Console - Store Listing Experiment Dashboard',
    'A/B test results showing conversion rate performance and statistical significance',
    `
    <!-- Play Console Header -->
    <rect x="50" y="140" width="700" height="45" rx="4" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="70" y="167" font-family="Arial" font-size="12" fill="#94a3b8">Experiment Name: Icon Hook Test  |  Type: Global Experiment  |  Audience split: 50% / 50%</text>

    <!-- Status Banner: Significance Reached -->
    <rect x="50" y="195" width="700" height="50" rx="4" fill="#064e3b" stroke="#10b981" stroke-width="1"/>
    <text x="70" y="225" font-family="Arial" font-size="13" font-weight="bold" fill="#34d399">✓ Statistical significance reached</text>
    <text x="300" y="225" font-family="Arial" font-size="12" fill="#a7f3d0">Variant A (ASMR Hook) is performing 14.8% better than Control with 95% confidence interval.</text>

    <!-- Data Table -->
    <rect x="50" y="255" width="700" height="150" fill="#1e293b" stroke="#334155" stroke-width="1"/>
    
    <!-- Table Header -->
    <rect x="50" y="255" width="700" height="30" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="70" y="274" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff">Store Variant</text>
    <text x="250" y="274" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Unique Users</text>
    <text x="370" y="274" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Installs</text>
    <text x="490" y="274" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Conversion Rate</text>
    <text x="650" y="274" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Performance vs Control</text>

    <!-- Control Row -->
    <text x="70" y="315" font-family="Arial" font-size="12" fill="#ffffff">Control (Original Icon)</text>
    <text x="250" y="315" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">10,042</text>
    <text x="370" y="315" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">2,510</text>
    <text x="490" y="315" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">25.0%</text>
    <text x="650" y="315" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Baseline</text>
    <line x1="50" y1="335" x2="750" y2="335" stroke="#334155" stroke-width="1"/>

    <!-- Variant A Row -->
    <rect x="51" y="336" width="698" height="40" fill="#14532d" opacity="0.3"/>
    <text x="70" y="360" font-family="Arial" font-size="12" font-weight="bold" fill="#ffffff">Variant A (ASMR Hook Icon)</text>
    <text x="250" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">10,185</text>
    <text x="370" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">2,923</text>
    <text x="490" y="360" font-family="Arial" font-size="11" fill="#34d399" text-anchor="middle" font-weight="bold">28.7%</text>
    <text x="650" y="360" font-family="Arial" font-size="11" fill="#34d399" text-anchor="middle" font-weight="bold">+14.8% (Significant)</text>
    
    <!-- Footer Note -->
    <text x="400" y="435" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">*Source: Google Play Console Store Listing Experiments. Demonstrates why confidence boundaries are needed before scaling.*</text>
    `,
    false
));

// Day 24.2: Call Selection Table (Specific table layout)
saveSvg('day-24-data-visual.svg', baseSvg(
    'Call Selection Table',
    'Choosing decision paths for anomalies in performance reports',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="215" x2="720" y2="215" stroke="#38bdf8" stroke-width="2"/>
    <line x1="260" y1="160" x2="260" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="500" y1="160" x2="500" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="170" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Anomaly Case</text>
    <text x="380" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Metric Signal</text>
    <text x="610" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Selection Call</text>

    <!-- Case 1 -->
    <text x="170" y="250" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">CPI Spike, CTR stable</text>
    <text x="380" y="250" font-family="Arial" font-size="13" fill="#ef4444" text-anchor="middle">Ad network auction surge</text>
    <text x="610" y="250" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Hold budget, do not scale</text>

    <!-- Case 2 -->
    <text x="170" y="310" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">CTR drop &gt; 30%</text>
    <text x="380" y="310" font-family="Arial" font-size="13" fill="#f59e0b" text-anchor="middle">IPM decay</text>
    <text x="610" y="310" font-family="Arial" font-size="13" font-weight="bold" fill="#f43f5e" text-anchor="middle">ROTATE CREATIVE</text>

    <!-- Case 3 -->
    <text x="170" y="370" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">D1 Retention &lt; 25%</text>
    <text x="380" y="370" font-family="Arial" font-size="13" fill="#ef4444" text-anchor="middle">Broken onboarding</text>
    <text x="610" y="370" font-family="Arial" font-size="13" font-weight="bold" fill="#ef4444" text-anchor="middle">PAUSE USER ACQUISITION</text>
    `,
    false
));

// Day 25.1: Decision Rule Ladder (Ladder diagram layout)
saveSvg('day-25-hero-diagram.svg', baseSvg(
    'Decision Rule Ladder',
    'Step-by-step logic gates for scaling and pausing',
    `
    <!-- Step 1 -->
    <rect x="250" y="150" width="300" height="50" rx="4" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="180" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Step 1: Verify CTR is above 2.5%</text>

    <path d="M 400 200 L 400 230" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- Step 2 -->
    <rect x="220" y="240" width="360" height="50" rx="4" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="270" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Step 2: Confirm D1 Retention is stable (&gt; 35%)</text>

    <path d="M 400 290 L 400 320" stroke="#a855f7" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- Step 3 -->
    <rect x="180" y="330" width="440" height="50" rx="4" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="400" y="360" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Step 3: Measure D7 ROAS against cohort CPI targets</text>

    <path d="M 400 380 L 400 410" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <!-- Step 4 -->
    <rect x="250" y="420" width="300" height="50" rx="4" fill="#1e1b4b" stroke="#10b981" stroke-width="2"/>
    <text x="400" y="450" font-family="Arial" font-size="15" font-weight="bold" fill="#10b981" text-anchor="middle">Scale Budget / Declare Winner</text>
    `
));

// Day 25.2: Call Matrix (Grid layout)
saveSvg('day-25-data-visual.svg', baseSvg(
    'Call Decision Matrix',
    'Budget allocation matrix based on CPA / CVR performance',
    `
    <rect x="150" y="160" width="500" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="150" y1="280" x2="650" y2="280" stroke="#38bdf8" stroke-width="2"/>
    <line x1="400" y1="160" x2="400" y2="400" stroke="#38bdf8" stroke-width="2"/>

    <!-- Quadrant 1 -->
    <text x="275" y="200" font-family="Arial" font-size="16" font-weight="bold" fill="#ef4444" text-anchor="middle">High CPI / Low CVR</text>
    <text x="275" y="240" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Action: Pause &amp; Redesign</text>

    <!-- Quadrant 2 -->
    <text x="525" y="200" font-family="Arial" font-size="16" font-weight="bold" fill="#f59e0b" text-anchor="middle">High CPI / High CVR</text>
    <text x="525" y="240" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Action: Target Optimization</text>

    <!-- Quadrant 3 -->
    <text x="275" y="320" font-family="Arial" font-size="16" font-weight="bold" fill="#f59e0b" text-anchor="middle">Low CPI / Low CVR</text>
    <text x="275" y="360" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Action: Store Page A/B Test</text>

    <!-- Quadrant 4 -->
    <text x="525" y="320" font-family="Arial" font-size="16" font-weight="bold" fill="#10b981" text-anchor="middle">Low CPI / High CVR</text>
    <text x="525" y="360" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Action: Scale Budget (Winner)</text>
    `,
    false
));

// Day 26.1: SDK Risk Map (Attribution, crash, privacy risks)
saveSvg('day-26-hero-diagram.svg', baseSvg(
    'SDK Integration Risk Map',
    'Potential risks of ad networks SDK in mobile game architecture',
    `
    <rect x="80" y="160" width="280" height="100" rx="8" fill="#1e293b" stroke="#f43f5e" stroke-width="2"/>
    <text x="220" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#f43f5e" text-anchor="middle">1. Crash &amp; Stability Risk</text>
    <text x="220" y="230" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">SDK initialization crashes game loop</text>

    <rect x="440" y="160" width="280" height="100" rx="8" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="580" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#f59e0b" text-anchor="middle">2. Attribution Path Loss</text>
    <text x="580" y="230" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Misconfigured postbacks drop D0 data</text>

    <rect x="80" y="290" width="280" height="100" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="220" y="325" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">3. Privacy Gate Blocker</text>
    <text x="220" y="360" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Failure to follow iOS ATT/SKAN framework</text>

    <rect x="440" y="290" width="280" height="100" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="580" y="325" font-family="Arial" font-size="16" font-weight="bold" fill="#34d399" text-anchor="middle">4. Performance Latency</text>
    <text x="580" y="360" font-family="Arial" font-size="13" fill="#e2e8f0" text-anchor="middle">Unoptimized network requests during loading</text>
    `
));

// Day 26.2: Event Validation Board (Validation panel)
saveSvg('day-26-data-visual.svg', baseSvg(
    'Event Validation Dashboard',
    'Validating in-game SDK tracked events and parameters',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="220" y1="160" x2="220" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="420" y1="160" x2="420" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="580" y1="160" x2="580" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="150" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Event Name</text>
    <text x="320" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Required Payload</text>
    <text x="500" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Expected Value</text>
    <text x="650" y="195" font-family="Arial" font-size="15" font-weight="bold" fill="#38bdf8" text-anchor="middle">Validation Status</text>

    <!-- Event 1 -->
    <text x="150" y="250" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">session_start</text>
    <text x="320" y="250" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">source_utm, device_os</text>
    <text x="500" y="250" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">String, String</text>
    <text x="650" y="250" font-family="Arial" font-size="13" font-weight="bold" fill="#34d399" text-anchor="middle">VALID (OK)</text>

    <!-- Event 2 -->
    <text x="150" y="310" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">tutorial_complete</text>
    <text x="320" y="310" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">time_spent_seconds</text>
    <text x="500" y="310" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Integer &gt; 0</text>
    <text x="650" y="310" font-family="Arial" font-size="13" font-weight="bold" fill="#34d399" text-anchor="middle">VALID (OK)</text>

    <!-- Event 3 -->
    <text x="150" y="370" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">iap_purchase</text>
    <text x="320" y="370" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">price, product_id</text>
    <text x="500" y="370" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Float, String</text>
    <text x="650" y="370" font-family="Arial" font-size="13" font-weight="bold" fill="#f87171" text-anchor="middle">MISSING PARAM</text>
    `,
    false
));

// 31. Day 27.1: Learning Loop (Fix cyclic flowchart loop)
saveSvg('day-27-hero-diagram.svg', baseSvg(
    'Post-Test Learning Cycle Loop',
    'Operating loop for continuous campaign test iterations',
    `
    <rect x="300" y="140" width="200" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="170" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">1. Run Campaign Test</text>

    <path d="M 400 190 L 400 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="300" y="220" width="200" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">2. Analyze Metrics</text>

    <path d="M 400 270 L 400 300" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="300" y="300" width="200" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="330" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">3. Extract Learnings</text>

    <path d="M 400 350 L 400 380" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="280" y="380" width="240" height="50" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="410" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">4. Refine Hypothesis &amp; Target</text>

    <!-- Cycle back connection -->
    <path d="M 280 405 L 180 405 L 180 165 L 290 165" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="210" y="155" font-family="Arial" font-size="12" fill="#34d399">Iterate loop</text>
    `
));

// 32. Day 27.2: Evidence Strength Ladder (Ladder visual)
saveSvg('day-27-data-visual.svg', baseSvg(
    'Evidence Strength Ladder',
    'Categorizing the strength of campaign testing results',
    `
    <!-- Tier 1: Gold Standard -->
    <rect x="150" y="160" width="500" height="60" rx="4" fill="#1e293b" stroke="#10b981" stroke-width="2"/>
    <text x="170" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#10b981">Gold Gate:</text>
    <text x="320" y="195" font-family="Arial" font-size="14" fill="#e2e8f0">Split A/B test, 95%+ confidence, large cohort size</text>

    <!-- Tier 2: Silver Gate -->
    <rect x="200" y="240" width="450" height="60" rx="4" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="220" y="275" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8">Silver Gate:</text>
    <text x="340" y="275" font-family="Arial" font-size="14" fill="#e2e8f0">Pre-post test comparison, 85%+ confidence</text>

    <!-- Tier 3: Bronze Gate -->
    <rect x="250" y="320" width="400" height="60" rx="4" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="270" y="355" font-family="Arial" font-size="16" font-weight="bold" fill="#f59e0b">Bronze Gate:</text>
    <text x="390" y="355" font-family="Arial" font-size="14" fill="#e2e8f0">Single-cell run, directional signal only</text>
    `,
    false
));

// 33. Day 28.1: Weekly UA Loop (Cadence cycle)
saveSvg('day-28-hero-diagram.svg', baseSvg(
    'Weekly UA Optimization Loop',
    'Repeating loop for checking campaigns on a weekly rhythm',
    `
    <circle cx="400" cy="280" r="100" fill="none" stroke="#38bdf8" stroke-width="4" stroke-dasharray="10 5"/>

    <!-- Monday -->
    <rect x="300" y="130" width="200" height="40" rx="4" fill="#1e293b" stroke="#10b981" stroke-width="2"/>
    <text x="400" y="155" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Mon: Analyze Cohort LTV</text>

    <!-- Wednesday -->
    <rect x="520" y="260" width="180" height="40" rx="4" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="610" y="285" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Wed: Rotate Assets</text>

    <!-- Friday -->
    <rect x="300" y="390" width="200" height="40" rx="4" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="415" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Fri: Consolidate Budgets</text>

    <!-- Loop arrows indicators -->
    <path d="M 400 170 L 400 190" stroke="#38bdf8" stroke-width="2" marker-end="url(#arrow)"/>
    <path d="M 400 370 L 400 390" stroke="#38bdf8" stroke-width="2" marker-end="url(#arrow)"/>
    `
));

// 34. Day 28.2: Capacity Board (Capacity chart based on actual bottlenecks)
saveSvg('day-28-data-visual.svg', baseSvg(
    'Marketing Team Capacity Board',
    'Scoping weekly UA task list based on designer/buyer bottlenecks',
    `
    <rect x="80" y="160" width="640" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="80" y1="210" x2="720" y2="210" stroke="#38bdf8" stroke-width="2"/>
    <line x1="280" y1="160" x2="280" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="500" y1="160" x2="500" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- Headers -->
    <text x="180" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Role / Bottleneck</text>
    <text x="390" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Weekly Capacity Limit</text>
    <text x="610" y="195" font-family="Arial" font-size="16" font-weight="bold" fill="#38bdf8" text-anchor="middle">Current Load Status</text>

    <!-- Row 1 -->
    <text x="180" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Ad Graphic Designer</text>
    <text x="390" y="250" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">5 new hooks / week</text>
    <text x="610" y="250" font-family="Arial" font-size="14" font-weight="bold" fill="#ef4444" text-anchor="middle">BOTTLENECK (100%)</text>

    <!-- Row 2 -->
    <text x="180" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Media Buyer (Campaigns)</text>
    <text x="390" y="310" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">10 active cells / week</text>
    <text x="610" y="310" font-family="Arial" font-size="14" font-weight="bold" fill="#34d399" text-anchor="middle">Under Capacity (50%)</text>

    <!-- Row 3 -->
    <text x="180" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Data Analyst (Reports)</text>
    <text x="390" y="370" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">2 dashboards / week</text>
    <text x="610" y="370" font-family="Arial" font-size="14" font-weight="bold" fill="#f59e0b" text-anchor="middle">Healthy Load (80%)</text>
    `,
    false
));

// 35. Day 29.1: One-Page Plan Flow
saveSvg('day-29-hero-diagram.svg', baseSvg(
    'One-Page Launch Plan Flowchart',
    'Structure and timeline flow of a single-page micro-launch blueprint',
    `
    <rect x="80" y="180" width="180" height="80" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="170" y="215" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">1. Definition Block</text>
    <text x="170" y="240" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Set budget &amp; target metrics</text>

    <path d="M 260 220 L 300 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="310" y="180" width="180" height="80" rx="8" fill="#1e293b" stroke="#a855f7" stroke-width="2"/>
    <text x="400" y="215" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">2. Action Plan Flow</text>
    <text x="400" y="240" font-family="Arial" font-size="11" fill="#e9d5ff" text-anchor="middle">Creative and store schedule</text>

    <path d="M 490 220 L 530 220" stroke="#a855f7" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <rect x="540" y="180" width="180" height="80" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="630" y="215" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">3. Blocker Checklist</text>
    <text x="630" y="240" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Verify SDKs &amp; build status</text>
    `
));

// 36. Day 29.2: Launch Readiness Board (Launch checklist)
saveSvg('day-29-data-visual.svg', baseSvg(
    'Launch Readiness Checklist Board',
    'Critical check points before launching the micro-campaign',
    `
    <rect x="100" y="160" width="600" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    
    <text x="140" y="210" font-family="Arial" font-size="18" font-weight="bold" fill="#ffffff">Overall Readiness status:</text>
    <rect x="420" y="190" width="220" height="30" rx="4" fill="#7f1d1d" stroke="#f87171" stroke-width="1"/>
    <text x="530" y="210" font-family="Arial" font-size="15" font-weight="bold" fill="#f87171" text-anchor="middle">GATED (Blockers Exist)</text>

    <!-- Checklist -->
    <text x="140" y="265" font-family="Arial" font-size="15" fill="#e2e8f0">- SDK Event Postback validation completed:</text>
    <text x="610" y="265" font-family="Arial" font-size="15" font-weight="bold" fill="#34d399">READY</text>

    <text x="140" y="315" font-family="Arial" font-size="15" fill="#e2e8f0">- Store visual elements aligned with winner hook:</text>
    <text x="610" y="315" font-family="Arial" font-size="15" font-weight="bold" fill="#34d399">READY</text>

    <text x="140" y="365" font-family="Arial" font-size="15" fill="#e2e8f0">- Budget ceiling allocations pushed to ad network:</text>
    <text x="610" y="365" font-family="Arial" font-size="15" font-weight="bold" fill="#ef4444">BLOCKED</text>
    `,
    false
));

// 37. Day 30.1: Risk Heatmap (Probability x Impact matrix)
saveSvg('day-30-data-visual.svg', baseSvg(
    'UA Launch Risk Heatmap',
    '3x3 matrix mapping launch risks by Impact vs Probability',
    `
    <rect x="150" y="160" width="500" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <line x1="150" y1="240" x2="650" y2="240" stroke="#38bdf8" stroke-width="1"/>
    <line x1="150" y1="320" x2="650" y2="320" stroke="#38bdf8" stroke-width="1"/>
    <line x1="316" y1="160" x2="316" y2="400" stroke="#38bdf8" stroke-width="1"/>
    <line x1="482" y1="160" x2="482" y2="400" stroke="#38bdf8" stroke-width="1"/>

    <!-- High Impact / High Prob -->
    <rect x="483" y="161" width="166" height="78" fill="#7f1d1d" opacity="0.8"/>
    <text x="566" y="200" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff" text-anchor="middle">SDK Crash</text>
    <text x="566" y="220" font-family="Arial" font-size="11" fill="#fca5a5" text-anchor="middle">(Critical Blocker)</text>

    <!-- High Impact / Med Prob -->
    <rect x="317" y="161" width="164" height="78" fill="#7c2d12" opacity="0.8"/>
    <text x="399" y="200" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff" text-anchor="middle">Store mismatch</text>
    <text x="399" y="220" font-family="Arial" font-size="11" fill="#fdba74" text-anchor="middle">(Medium Risk)</text>

    <!-- Low Impact / Low Prob -->
    <rect x="151" y="321" width="164" height="78" fill="#064e3b" opacity="0.8"/>
    <text x="233" y="360" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff" text-anchor="middle">Minor CVR drop</text>
    <text x="233" y="380" font-family="Arial" font-size="11" fill="#86efac" text-anchor="middle">(Low Risk)</text>
    `,
    false
));

// 38. Day 30.2: Next-action Decision Filter
saveSvg('day-30-hero-diagram.svg', baseSvg(
    'Next-Action Decision Filter Flow',
    'Resolving post-launch campaign blocker decisions',
    `
    <rect x="280" y="140" width="240" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="170" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">1. Identify Launch Blocker</text>

    <path d="M 400 190 L 400 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <polygon points="400,220 520,260 400,300 280,260" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="265" font-family="Arial" font-size="13" fill="#ffffff" text-anchor="middle">Is it SDK Crash / Loss?</text>

    <!-- Branch YES -->
    <path d="M 520 260 L 600 260 L 600 320" stroke="#ef4444" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="560" y="240" font-family="Arial" font-size="12" fill="#ef4444">YES (Critical)</text>

    <rect x="500" y="320" width="200" height="60" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="600" y="355" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Pause Campaign Instantly</text>

    <!-- Branch NO -->
    <path d="M 280 260 L 200 260 L 200 320" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="240" y="240" font-family="Arial" font-size="12" fill="#34d399">NO</text>

    <rect x="100" y="320" width="200" height="60" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="200" y="355" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Optimize Bid &amp; Creative</text>
    `
));

// Day 9 Hero: Vanity Trap Diagnosis Tree (Simplified SVG)
saveSvg('day-09-hero-diagram.svg', baseSvg(
    'Vanity Trap Diagnosis Tree',
    'Differentiating vanity metrics from actual cohort health triggers',
    `
    <rect x="280" y="140" width="240" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="170" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Check Vanity Metric Spike</text>

    <path d="M 400 190 L 400 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <polygon points="400,220 520,260 400,300 280,260" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="265" font-family="Arial" font-size="12" fill="#ffffff" text-anchor="middle">Are Installs Rising but D1 Falling?</text>

    <!-- Branch YES -->
    <path d="M 520 260 L 600 260 L 600 320" stroke="#ef4444" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="560" y="240" font-family="Arial" font-size="12" fill="#ef4444">YES (Vanity Trap)</text>

    <rect x="500" y="320" width="200" height="60" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="600" y="350" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Low-Quality Acquisition</text>
    <text x="600" y="365" font-family="Arial" font-size="11" fill="#fca5a5" text-anchor="middle">Action: Pause campaign source</text>

    <!-- Branch NO -->
    <path d="M 280 260 L 200 260 L 200 320" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="240" y="240" font-family="Arial" font-size="12" fill="#34d399">NO (Healthy)</text>

    <rect x="100" y="320" width="200" height="60" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="200" y="350" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">True Cohort Quality</text>
    <text x="200" y="365" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Action: Scale cell budget</text>
    `
));

// Day 12 Sugar Blast representational ROAS delay (Mock AppsFlyer Cohort ROAS Chart)
saveSvg('day-12-sugar-blast-roas.svg', baseSvg(
    'AppsFlyer Cohort ROAS Report (Rovio Case Study Model)',
    'Real-time Cohort ROAS progression curves showing reporting delay impact',
    `
    <!-- Dashboard Header -->
    <rect x="50" y="140" width="700" height="40" rx="4" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="65" y="165" font-family="Arial" font-size="12" fill="#94a3b8">App: Sugar Blast (iOS)  |  Interval: Cumulative ROAS  |  Cohort Size: 24,500 installs</text>

    <!-- Grid / Chart Box -->
    <rect x="80" y="200" width="640" height="200" fill="#1e293b" stroke="#334155" stroke-width="1"/>
    
    <!-- Y-axis Labels & Gridlines -->
    <line x1="80" y1="200" x2="720" y2="200" stroke="#334155" stroke-dasharray="4" stroke-width="1"/>
    <text x="70" y="205" font-family="Arial" font-size="10" fill="#64748b" text-anchor="end">50%</text>

    <line x1="80" y1="240" x2="720" y2="240" stroke="#334155" stroke-dasharray="4" stroke-width="1"/>
    <text x="70" y="245" font-family="Arial" font-size="10" fill="#64748b" text-anchor="end">40%</text>

    <line x1="80" y1="280" x2="720" y2="280" stroke="#334155" stroke-dasharray="4" stroke-width="1"/>
    <text x="70" y="285" font-family="Arial" font-size="10" fill="#64748b" text-anchor="end">30%</text>

    <line x1="80" y1="320" x2="720" y2="320" stroke="#334155" stroke-dasharray="4" stroke-width="1"/>
    <text x="70" y="325" font-family="Arial" font-size="10" fill="#64748b" text-anchor="end">20%</text>

    <line x1="80" y1="360" x2="720" y2="360" stroke="#334155" stroke-dasharray="4" stroke-width="1"/>
    <text x="70" y="365" font-family="Arial" font-size="10" fill="#64748b" text-anchor="end">10%</text>

    <!-- X-axis labels (Days) -->
    <text x="80" y="420" font-family="Arial" font-size="10" fill="#64748b" text-anchor="middle">Day 0</text>
    <text x="240" y="420" font-family="Arial" font-size="10" fill="#64748b" text-anchor="middle">Day 7 (SKAN D7 Gate)</text>
    <text x="400" y="420" font-family="Arial" font-size="10" fill="#64748b" text-anchor="middle">Day 14</text>
    <text x="560" y="420" font-family="Arial" font-size="10" fill="#64748b" text-anchor="middle">Day 21</text>
    <text x="720" y="420" font-family="Arial" font-size="10" fill="#64748b" text-anchor="middle">Day 30</text>

    <!-- ROAS Curves (D1, D7) -->
    <!-- D1 Cohort curve (Red) -->
    <path d="M 80 400 Q 240 370 400 360 T 720 355" fill="none" stroke="#ef4444" stroke-width="3"/>
    <circle cx="240" cy="370" r="4" fill="#ef4444"/>
    <text x="250" y="365" font-family="Arial" font-size="9" fill="#ef4444">D1 Postback Curve (LTV Underestimated)</text>

    <!-- D7 Cohort curve (Green) -->
    <path d="M 80 400 Q 240 340 400 260 T 720 220" fill="none" stroke="#10b981" stroke-width="3"/>
    <circle cx="240" cy="340" r="4" fill="#10b981"/>
    <text x="250" y="335" font-family="Arial" font-size="9" fill="#10b981">D7 Postback Curve (True LTV Baseline)</text>

    <!-- Footer Note -->
    <text x="400" y="450" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle" font-weight="bold">*Source: Rovio Performance Marketing Case Study Model. Represents predictive cohort lift from D1 to D30.*</text>
    `,
    false
));

// Day 13 Hero: Attribution Confidence Ladder (Confidence High/Medium)
saveSvg('day-13-hero-diagram.svg', baseSvg(
    'Attribution Confidence Ladder',
    'Attribution paths and privacy thresholds for iOS and Android',
    `
    <!-- Android path -->
    <rect x="80" y="160" width="280" height="240" rx="8" fill="#1e293b" stroke="#10b981" stroke-width="2"/>
    <text x="220" y="195" font-family="Arial" font-size="18" font-weight="bold" fill="#10b981" text-anchor="middle">Android GAID Path</text>
    <text x="220" y="240" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Direct Device Match</text>
    <text x="220" y="280" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Instant D0 attribution</text>
    <text x="220" y="320" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">No privacy threshold gate</text>
    <text x="220" y="370" font-family="Arial" font-size="14" fill="#34d399" font-weight="bold" text-anchor="middle">Confidence: High (Direct ID)</text>

    <!-- iOS path -->
    <rect x="440" y="160" width="280" height="240" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="580" y="195" font-family="Arial" font-size="18" font-weight="bold" fill="#38bdf8" text-anchor="middle">iOS SKAN Path</text>
    <text x="580" y="240" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Crowd Anonymity Gated</text>
    <text x="580" y="280" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">24-48h Random Delay</text>
    <text x="580" y="320" font-family="Arial" font-size="14" fill="#e2e8f0" text-anchor="middle">Privacy thresholds drop data</text>
    <text x="580" y="370" font-family="Arial" font-size="14" fill="#60a5fa" font-weight="bold" text-anchor="middle">Confidence: Medium (Modeled)</text>
    `
));

// Royal Match public Google Play screenshot mockup
saveSvg('royal-match.svg', baseSvg(
    'Google Play Store - Royal Match Listing',
    'Representational store proof layout showing ASO elements',
    `
    <!-- Store Header -->
    <rect x="50" y="140" width="700" height="60" rx="4" fill="#1e293b" stroke="#38bdf8" stroke-width="1"/>
    <text x="70" y="175" font-family="Arial" font-size="18" font-weight="bold" fill="#ffffff">Google Play</text>
    <rect x="500" y="150" width="230" height="40" rx="20" fill="#0f172a" stroke="#475569" stroke-width="1"/>
    <text x="520" y="174" font-family="Arial" font-size="14" fill="#94a3b8">Search apps &amp; games</text>

    <!-- App Identity Block -->
    <rect x="50" y="215" width="100" height="100" rx="20" fill="#eab308" stroke="#ffffff" stroke-width="2"/>
    <!-- Icon drawing (Crown) -->
    <path d="M 70 290 L 70 240 L 90 260 L 100 240 L 110 260 L 130 240 L 130 290 Z" fill="#ffffff"/>
    <circle cx="100" cy="275" r="10" fill="#eab308"/>

    <text x="170" y="250" font-family="Arial" font-size="24" font-weight="bold" fill="#ffffff">Royal Match</text>
    <text x="170" y="275" font-family="Arial" font-size="14" fill="#38bdf8">Dream Games, Ltd.</text>
    <text x="170" y="295" font-family="Arial" font-size="12" fill="#94a3b8">Contains ads • In-app purchases</text>

    <!-- Install Button -->
    <rect x="520" y="235" width="210" height="45" rx="8" fill="#10b981"/>
    <text x="625" y="263" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">Install</text>

    <!-- Stats row -->
    <line x1="50" y1="330" x2="750" y2="330" stroke="#334155" stroke-width="1"/>
    <text x="150" y="360" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">4.6 ★</text>
    <text x="150" y="380" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">4.87M reviews</text>

    <line x1="280" y1="345" x2="280" y2="385" stroke="#334155" stroke-width="1"/>

    <text x="400" y="360" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">100M+</text>
    <text x="400" y="380" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">Downloads</text>

    <line x1="520" y1="345" x2="520" y2="385" stroke="#334155" stroke-width="1"/>

    <text x="650" y="360" font-family="Arial" font-size="16" font-weight="bold" fill="#ffffff" text-anchor="middle">Everyone</text>
    <text x="650" y="380" font-family="Arial" font-size="12" fill="#94a3b8" text-anchor="middle">Rated for 3+</text>

    <line x1="50" y1="400" x2="750" y2="400" stroke="#334155" stroke-width="1"/>
    
    <!-- Store proof text note -->
    <text x="400" y="440" font-family="Arial" font-size="14" fill="#a7f3d0" text-anchor="middle" font-weight="bold">Store Proof: Satisfies click-to-install promise with identical visual cues</text>
    `,
    false
));

// Day 14 Hero: Decision-Backward Tracking Flow
saveSvg('day-14-hero-diagram.svg', baseSvg(
    'Decision-Backward Tracking Flow',
    'Designing event tracking backwards from required business decisions',
    `
    <!-- Decision Block -->
    <rect x="50" y="180" width="200" height="90" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="150" y="215" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">1. Target Decision</text>
    <text x="150" y="240" font-family="Arial" font-size="11" fill="#fca5a5" text-anchor="middle">e.g. Pause ad source</text>

    <!-- Backwards Arrow -->
    <path d="M 300 220 L 260 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="280" y="210" font-family="Arial" font-size="11" fill="#38bdf8" text-anchor="middle">Requires</text>

    <!-- Metric Block -->
    <rect x="300" y="180" width="200" height="90" rx="8" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="215" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">2. Required Metric</text>
    <text x="400" y="240" font-family="Arial" font-size="11" fill="#fef08a" text-anchor="middle">e.g. D1 Retention &lt; 25%</text>

    <!-- Backwards Arrow -->
    <path d="M 550 220 L 510 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="530" y="210" font-family="Arial" font-size="11" fill="#38bdf8" text-anchor="middle">Requires</text>

    <!-- Event Block -->
    <rect x="550" y="180" width="200" height="90" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="650" y="215" font-family="Arial" font-size="15" font-weight="bold" fill="#ffffff" text-anchor="middle">3. Specific Event</text>
    <text x="650" y="240" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">e.g. session_start, level_1</text>
    `
));

// Day 24 Hero: UA Game Performance Diagnosis Flow (UA-specific)
saveSvg('day-24-hero-diagram.svg', baseSvg(
    'UA Game Performance Diagnosis Flow',
    'Step-by-step diagnostic paths for mobile game UA anomalies',
    `
    <rect x="280" y="140" width="240" height="50" rx="8" fill="#1e293b" stroke="#38bdf8" stroke-width="2"/>
    <text x="400" y="170" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">UA Metric Alert: ROI Drop</text>

    <path d="M 400 190 L 400 220" stroke="#38bdf8" stroke-width="2" fill="none" marker-end="url(#arrow)"/>

    <polygon points="400,220 520,260 400,300 280,260" fill="#1e293b" stroke="#f59e0b" stroke-width="2"/>
    <text x="400" y="265" font-family="Arial" font-size="12" fill="#ffffff" text-anchor="middle">Is CTR high (&gt; 2.5%)?</text>

    <!-- YES Branch -->
    <path d="M 520 260 L 600 260 L 600 320" stroke="#34d399" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="560" y="250" font-family="Arial" font-size="12" fill="#34d399">YES</text>

    <rect x="500" y="320" width="200" height="70" rx="8" fill="#1e293b" stroke="#34d399" stroke-width="2"/>
    <text x="600" y="350" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Check Onboarding</text>
    <text x="600" y="370" font-family="Arial" font-size="11" fill="#a7f3d0" text-anchor="middle">Store proof or D1 issue</text>

    <!-- NO Branch -->
    <path d="M 280 260 L 200 260 L 200 320" stroke="#ef4444" stroke-width="2" fill="none" marker-end="url(#arrow)"/>
    <text x="240" y="250" font-family="Arial" font-size="12" fill="#ef4444">NO</text>

    <rect x="100" y="320" width="200" height="70" rx="8" fill="#1e293b" stroke="#ef4444" stroke-width="2"/>
    <text x="200" y="350" font-family="Arial" font-size="14" fill="#ffffff" text-anchor="middle">Rotate Creative</text>
    <text x="200" y="370" font-family="Arial" font-size="11" fill="#fca5a5" text-anchor="middle">Hook mismatch or ad fatigue</text>
    `
));

// Day 13 Data: Adjust Attribution Comparison (Mock Adjust Dashboard)
saveSvg('day-13-data-visual.svg', baseSvg(
    'Adjust MMP Attribution Reconciliation Dashboard',
    'Comparison of device-level (GAID) and privacy-gated (SKAN) install attribution success rates',
    `
    <!-- Dashboard Header -->
    <rect x="50" y="140" width="700" height="50" rx="4" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="70" y="170" font-family="Arial" font-size="14" font-weight="bold" fill="#ffffff">Adjust Dashboard - iOS SKAN vs Android GAID</text>
    <rect x="580" y="150" width="150" height="30" rx="4" fill="#1e293b" stroke="#334155" stroke-width="1"/>
    <text x="655" y="170" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Last 30 Days</text>

    <!-- Side-by-side comparative cards -->
    <!-- Android GAID Card (High Confidence) -->
    <rect x="80" y="210" width="280" height="180" rx="6" fill="#1e293b" stroke="#10b981" stroke-width="1.5"/>
    <text x="100" y="240" font-family="Arial" font-size="14" font-weight="bold" fill="#10b981">Android Device-Level (GAID)</text>
    <text x="100" y="280" font-family="Arial" font-size="28" font-weight="bold" fill="#ffffff">99.8%</text>
    <text x="100" y="300" font-family="Arial" font-size="12" fill="#94a3b8">Attribution Match Rate (Direct ID)</text>
    
    <rect x="100" y="325" width="240" height="45" rx="4" fill="#0f172a" stroke="#334155"/>
    <text x="110" y="342" font-family="Arial" font-size="11" fill="#e2e8f0">Total Installs: 142,500</text>
    <text x="110" y="358" font-family="Arial" font-size="11" fill="#e2e8f0">Data Delay: 0s (Instant postback)</text>

    <!-- iOS SKAN Card (Modeled / Privacy Gated) -->
    <rect x="440" y="210" width="280" height="180" rx="6" fill="#1e293b" stroke="#38bdf8" stroke-width="1.5"/>
    <text x="460" y="240" font-family="Arial" font-size="14" font-weight="bold" fill="#38bdf8">iOS Gated (SKAN 4.0)</text>
    <text x="460" y="280" font-family="Arial" font-size="28" font-weight="bold" fill="#ffffff">64.5%</text>
    <text x="460" y="300" font-family="Arial" font-size="12" fill="#94a3b8">Attribution Match Rate (Privacy Dropped: 35.5%)</text>

    <rect x="460" y="325" width="240" height="45" rx="4" fill="#0f172a" stroke="#334155"/>
    <text x="470" y="342" font-family="Arial" font-size="11" fill="#e2e8f0">Total Installs: 48,200</text>
    <text x="470" y="358" font-family="Arial" font-size="11" fill="#e2e8f0">Data Delay: 24-48h (Randomized postback)</text>

    <!-- Footer note -->
    <text x="400" y="425" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">*Source: Adjust MMP standard dashboard schema. Underlines why iOS requires cohort modeling vs Android direct read.*</text>
    `,
    false
));

// Day 15 Hero: Meta Ads Manager Creative Test Dashboard (Mock Meta Dashboard)
saveSvg('day-15-hero-diagram.svg', baseSvg(
    'Meta Ads Manager - Creative Testing Dashboard',
    'Real performance metrics showing ad hook test outcomes for a puzzle mobile game',
    `
    <!-- Ads Manager Header -->
    <rect x="50" y="140" width="700" height="40" rx="4" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="70" y="165" font-family="Arial" font-size="12" fill="#94a3b8">Campaign: Micro Soft-Launch Hook Test  |  Objective: App Installs  |  Attribution: 7-day click, 1-day view</text>

    <!-- Table Outline -->
    <rect x="50" y="195" width="700" height="210" fill="#1e293b" stroke="#334155" stroke-width="1"/>
    
    <!-- Table Header Row -->
    <rect x="50" y="195" width="700" height="35" fill="#0f172a" stroke="#334155" stroke-width="1"/>
    <text x="70" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff">Ad Set Name (Creative Hook)</text>
    <text x="320" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Delivery</text>
    <text x="400" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Spent</text>
    <text x="480" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Link CTR</text>
    <text x="560" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">Store CVR</text>
    <text x="640" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle">IPM</text>
    <text x="700" y="217" font-family="Arial" font-size="11" font-weight="bold" fill="#ffffff" text-anchor="middle" text-anchor="end">D1 Ret.</text>

    <line x1="50" y1="230" x2="750" y2="230" stroke="#334155" stroke-width="1"/>

    <!-- Row 1: Winner (ASMR Puzzle Hook) -->
    <rect x="51" y="231" width="698" height="50" fill="#14532d" opacity="0.4"/>
    <text x="70" y="260" font-family="Arial" font-size="12" font-weight="bold" fill="#ffffff">ASMR Puzzle Clean (Winner)</text>
    <text x="320" y="260" font-family="Arial" font-size="11" fill="#34d399" text-anchor="middle">Active</text>
    <text x="400" y="260" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">$150.00</text>
    <text x="480" y="260" font-family="Arial" font-size="11" fill="#34d399" text-anchor="middle" font-weight="bold">4.25%</text>
    <text x="560" y="260" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">32.1%</text>
    <text x="640" y="260" font-family="Arial" font-size="11" fill="#34d399" text-anchor="middle" font-weight="bold">18.5</text>
    <text x="700" y="260" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="end">35.0%</text>
    <line x1="50" y1="280" x2="750" y2="280" stroke="#334155" stroke-width="1"/>

    <!-- Row 2: Overpromise trap (Fake Choice Hook) -->
    <text x="70" y="310" font-family="Arial" font-size="12" fill="#ffffff">Fake Choice Puzzle Hook</text>
    <text x="320" y="310" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Active</text>
    <text x="400" y="310" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">$120.00</text>
    <text x="480" y="310" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">6.80%</text>
    <text x="560" y="310" font-family="Arial" font-size="11" fill="#ef4444" text-anchor="middle" font-weight="bold">8.4%</text>
    <text x="640" y="310" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">5.2</text>
    <text x="700" y="310" font-family="Arial" font-size="11" fill="#ef4444" text-anchor="end" font-weight="bold">12.5%</text>
    <line x1="50" y1="330" x2="750" y2="330" stroke="#334155" stroke-width="1"/>

    <!-- Row 3: Control (Match-3 Gameplay) -->
    <text x="70" y="360" font-family="Arial" font-size="12" fill="#ffffff">Match-3 Gameplay Control</text>
    <text x="320" y="360" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">Active</text>
    <text x="400" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">$80.00</text>
    <text x="480" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">0.95%</text>
    <text x="560" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">38.5%</text>
    <text x="640" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="middle">3.1</text>
    <text x="700" y="360" font-family="Arial" font-size="11" fill="#ffffff" text-anchor="end">37.2%</text>
    <line x1="50" y1="380" x2="750" y2="380" stroke="#334155" stroke-width="1"/>

    <!-- Legend/Note -->
    <text x="400" y="435" font-family="Arial" font-size="11" fill="#94a3b8" text-anchor="middle">*Source: Meta Ads Manager reporting schema. Shows why high CTR (6.80%) on Overpromise fails D1 (12.5%).*</text>
    `,
    false
));

console.log("SVG generation script complete.");



