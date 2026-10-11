import { readFile } from "node:fs/promises"

const dataUrl = new URL("../lib/data.ts", import.meta.url)
const source = await readFile(dataUrl, "utf8")
const cardUrl = new URL("../components/ArchiveCard.tsx", import.meta.url)
const cardSource = await readFile(cardUrl, "utf8")

const projectsStart = source.indexOf("export const projects")
const resourcesStart = source.indexOf("export const resourceCategories")

if (projectsStart === -1 || resourcesStart === -1) {
    throw new Error("Could not locate the projects array in lib/data.ts")
}

const projectsSource = source.slice(projectsStart, resourcesStart)
const entryPattern = /\{[\s\S]*?\n\s*\},/g
const entries = projectsSource.match(entryPattern) ?? []
const project2026 = entries.find((entry) => /year:\s*["']2026["']/.test(entry))
const project2025Index = entries.findIndex((entry) => /year:\s*["']2025["']/.test(entry))

if (!project2026) {
    throw new Error("Missing the 2026 project entry")
}

const project2026Index = entries.indexOf(project2026)

if (project2026Index !== 0 || project2025Index === -1 || project2026Index >= project2025Index) {
    throw new Error("The 2026 project must be the first entry and appear before 2025")
}

const requiredFields = [
    [/title:\s*["']Helix Trap["']/, "title Helix Trap"],
    [/description:\s*["']Nano JLU[^"']*序列特异性[^"']*纳米级捕鼠器[^"']*["']/, "Nano JLU sequence-specific nanoscale mousetrap description"],
    [/award:\s*["']Concept Preview["']/, "award Concept Preview"],
    [/link:\s*["']\/2026\/["']/, "link /2026/"],
    [/color:\s*["']text-(?:cyan|blue|indigo|emerald|violet|pink|orange)-\d{3}["']/, "an existing project color class"],
]

for (const [pattern, label] of requiredFields) {
    if (!pattern.test(project2026)) {
        throw new Error(`The 2026 project entry is missing ${label}`)
    }
}

if (!cardSource.includes("<a href={project.link}>") || cardSource.includes("<Link href={project.link}>") ) {
    throw new Error("Archive cards must use plain anchors for static archive and /2026/ destinations")
}

console.log("2026 project entry check passed")
