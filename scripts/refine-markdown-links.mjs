import { readFileSync, writeFileSync } from 'fs';
import path from 'path';

const lessonsDir = path.join(process.cwd(), 'content', 'lessons');

const replacements = [
  // Day 1
  {
    file: 'day-01.md',
    search: 'day-01-hero-diagram.png',
    replace: 'day-01-hero-diagram.svg'
  },
  {
    file: 'day-01.md',
    search: 'day-01-data-visual.png',
    replace: 'day-01-data-visual.svg'
  },
  // Day 2
  {
    file: 'day-02.md',
    search: 'day-02-market-thesis-visual.png',
    replace: 'day-02-market-thesis-visual.svg'
  },
  // Day 3
  {
    file: 'day-03.md',
    search: '![Hero visual: motivation-to-proof chain](content/assets/usecases/day-03-motivation-map-visual.svg)',
    replace: '![Hero visual: motivation-to-proof chain](content/assets/usecases/day-03-motivation-to-proof-chain.svg)'
  },
  // Day 4
  {
    file: 'day-04.md',
    search: '![Funnel leak map mẫu](content/assets/usecases/day-04-funnel-visual.png)',
    replace: '![Funnel leak map mẫu](content/assets/usecases/day-04-funnel-leak-map.svg)'
  },
  {
    file: 'day-04.md',
    search: '![Funnel leak operating diagram](content/assets/usecases/day-04-funnel-visual.png)',
    replace: '![Funnel leak operating diagram](content/assets/usecases/day-04-funnel-leak-operating-diagram.svg)'
  },
  // Day 6
  {
    file: 'day-06.md',
    search: 'day-06-data-visual.png',
    replace: 'day-06-data-visual.svg'
  },
  // Day 7
  {
    file: 'day-07.md',
    search: 'day-07-hero-diagram.png',
    replace: 'day-07-hero-diagram.svg'
  },
  {
    file: 'day-07.md',
    search: 'royal-match.png',
    replace: 'royal-match.svg'
  },
  // Day 8
  {
    file: 'day-08.md',
    search: 'day-08-data-visual.png',
    replace: 'day-08-data-visual.svg'
  },
  // Day 9
  {
    file: 'day-09.md',
    search: 'day-09-data-visual.png',
    replace: 'day-09-data-visual.svg'
  },
  {
    file: 'day-09.md',
    search: 'day-09-hero-diagram.png',
    replace: 'day-09-hero-diagram.svg'
  },
  // Day 10 (Swap visuals)
  {
    file: 'day-10.md',
    search: '![Retention decay curve comparison](content/assets/usecases/day-10-data-visual.png)',
    replace: '![Retention decay curve comparison](content/assets/usecases/day-10-hero-diagram.png)'
  },
  {
    file: 'day-10.md',
    search: '![First session progression funnel](content/assets/usecases/day-10-hero-diagram.png)',
    replace: '![First session progression funnel](content/assets/usecases/day-10-data-visual.png)'
  },
  // Day 13
  {
    file: 'day-13.md',
    search: 'day-13-hero-diagram.png',
    replace: 'day-13-hero-diagram.svg'
  },
  {
    file: 'day-13.md',
    search: 'day-13-data-visual.png',
    replace: 'day-13-data-visual.svg'
  },
  // Day 11
  {
    file: 'day-11.md',
    search: 'day-11-hero-diagram.png',
    replace: 'day-11-hero-diagram.svg'
  },
  {
    file: 'day-11.md',
    search: 'day-11-data-visual.png',
    replace: 'day-11-data-visual.svg'
  },
  // Day 12
  {
    file: 'day-12.md',
    search: '![Rovio Sugar Blast ROAS Delay optimization representational diagram](content/assets/usecases/candy-crush.png)',
    replace: '![Rovio Sugar Blast ROAS Delay optimization representational diagram](content/assets/usecases/day-12-sugar-blast-roas.svg)'
  },
  {
    file: 'day-12.md',
    search: 'day-12-hero-diagram.png',
    replace: 'day-12-hero-diagram.svg'
  },
  {
    file: 'day-12.md',
    search: 'day-12-data-visual.png',
    replace: 'day-12-data-visual.svg'
  },
  // Day 13
  {
    file: 'day-13.md',
    search: '![Hero visual: attribution confidence ladder](content/assets/usecases/day-13-hero-diagram.png)',
    replace: '![Hero visual: attribution confidence ladder](content/assets/usecases/day-13-hero-diagram.svg)'
  },
  // Day 15
  // Day 14
  {
    file: 'day-14.md',
    search: 'day-14-hero-diagram.png',
    replace: 'day-14-hero-diagram.svg'
  },
  {
    file: 'day-14.md',
    search: '![Event coverage heatmap](content/assets/usecases/day-14-data-visual.png)',
    replace: '![Event coverage funnel](content/assets/usecases/day-14-data-visual.png)'
  },
  // Day 15
  {
    file: 'day-15.md',
    search: '![Hook motivation operating map](content/assets/usecases/day-15-data-visual.png)',
    replace: '![Hook motivation operating map](content/assets/usecases/day-15-data-visual.svg)'
  },
  {
    file: 'day-15.md',
    search: '![Hook signal board](content/assets/usecases/day-15-hero-diagram.png)',
    replace: '![Hook signal board](content/assets/usecases/day-15-hero-diagram.svg)'
  },
  // Day 16
  {
    file: 'day-16.md',
    search: 'day-16-data-visual.png',
    replace: 'day-16-data-visual.svg'
  },
  {
    file: 'day-16.md',
    search: 'day-16-hero-diagram.png',
    replace: 'day-16-hero-diagram.svg'
  },
  // Day 17
  {
    file: 'day-17.md',
    search: 'day-17-data-visual.png',
    replace: 'day-17-data-visual.svg'
  },
  {
    file: 'day-17.md',
    search: 'day-17-hero-diagram.png',
    replace: 'day-17-hero-diagram.svg'
  },
  // Day 18 (Only 18.2 is modified, 18.1 is ✅ PNG)
  {
    file: 'day-18.md',
    search: 'day-18-data-visual.png',
    replace: 'day-18-data-visual.svg'
  },
  // Day 19
  {
    file: 'day-19.md',
    search: 'day-19-data-visual.png',
    replace: 'day-19-data-visual.svg'
  },
  {
    file: 'day-19.md',
    search: 'day-19-hero-diagram.png',
    replace: 'day-19-hero-diagram.svg'
  },
  // Day 20
  {
    file: 'day-20.md',
    search: 'day-20-data-visual.png',
    replace: 'day-20-data-visual.svg'
  },
  {
    file: 'day-20.md',
    search: 'day-20-hero-diagram.png',
    replace: 'day-20-hero-diagram.svg'
  },
  // Day 21
  {
    file: 'day-21.md',
    search: 'day-21-data-visual.png',
    replace: 'day-21-data-visual.svg'
  },
  {
    file: 'day-21.md',
    search: 'day-21-hero-diagram.png',
    replace: 'day-21-hero-diagram.svg'
  },
  // Day 22
  {
    file: 'day-22.md',
    search: 'day-22-data-visual.png',
    replace: 'day-22-data-visual.svg'
  },
  {
    file: 'day-22.md',
    search: 'day-22-hero-diagram.png',
    replace: 'day-22-hero-diagram.svg'
  },
  // Day 23
  {
    file: 'day-23.md',
    search: 'day-23-data-visual.png',
    replace: 'day-23-data-visual.svg'
  },
  {
    file: 'day-23.md',
    search: 'day-23-hero-diagram.png',
    replace: 'day-23-hero-diagram.svg'
  },
  // Day 24
  {
    file: 'day-24.md',
    search: 'day-24-hero-diagram.png',
    replace: 'day-24-hero-diagram.svg'
  }
];

replacements.forEach(r => {
  const filePath = path.join(lessonsDir, r.file);
  try {
    let content = readFileSync(filePath, 'utf8');
    if (content.includes(r.search)) {
      content = content.replace(r.search, r.replace);
      writeFileSync(filePath, content, 'utf8');
      console.log(`Refined ${r.file}: Replaced ${r.search.substring(0, 30)}...`);
    } else {
      console.log(`Skipped ${r.file}: Search string not found`);
    }
  } catch (err) {
    console.error(`Error processing ${r.file}: ${err.message}`);
  }
});
