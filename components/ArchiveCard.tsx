import Link from "next/link"
import { ArrowRight } from "lucide-react"
import { cn } from "@/lib/utils"
import { Project } from "@/lib/data"
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"
import { Button } from "@/components/ui/button"

interface ArchiveCardProps {
    project: Project
}

export function ArchiveCard({ project }: ArchiveCardProps) {
    return (
        <Card className="flex flex-col overflow-hidden border-border/50 bg-card/50 backdrop-blur-sm transition-all hover:border-primary/50 hover:shadow-lg hover:shadow-primary/5">
            <div className="aspect-video w-full bg-muted/50 relative overflow-hidden group">
                {/* Placeholder for image */}
                <div className={cn("absolute inset-0 opacity-20", project.color.replace("text-", "bg-"))} />
                <div className="absolute inset-0 flex items-center justify-center text-4xl font-bold opacity-10 group-hover:scale-110 transition-transform duration-500">
                    {project.year}
                </div>
            </div>
            <CardHeader className="pb-2">
                <div className="flex items-center justify-between">
                    <span className={cn("text-sm font-bold", project.color)}>
                        {project.year}
                    </span>
                    {project.award && (
                        <span className="rounded-full bg-primary/10 px-2.5 py-0.5 text-xs font-medium text-primary">
                            {project.award}
                        </span>
                    )}
                </div>
                <h3 className="text-xl font-bold leading-tight">{project.title}</h3>
            </CardHeader>
            <CardContent className="flex-1 pb-4">
                <p className="text-sm text-muted-foreground">{project.description}</p>
            </CardContent>
            <CardFooter>
                <Button asChild variant="outline" className="w-full group">
                    <Link href={project.link}>
                        查看项目
                        <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
                    </Link>
                </Button>
            </CardFooter>
        </Card>
    )
}
