import { projects } from "@/lib/data"
import { ArchiveCard } from "@/components/ArchiveCard"

export default function ArchivePage() {
    return (
        <div className="container py-12 md:py-24 px-4 md:px-8 mx-auto">
            <div className="mb-12 space-y-4">
                <h1 className="text-3xl font-bold tracking-tighter sm:text-4xl md:text-5xl">历年参赛作品归档</h1>
                <p className="max-w-[700px] text-muted-foreground md:text-xl">
                    探索吉林大学 BIOMOD 团队在历届国际生物分子设计大赛中的创新项目与成果。
                </p>
            </div>
            <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                {projects.map((project) => (
                    <ArchiveCard key={project.year} project={project} />
                ))}
            </div>
        </div>
    )
}
