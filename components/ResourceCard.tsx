import Link from "next/link"
import { ArrowRight } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

interface ResourceCardProps {
    icon: string
    title: string
    description: string
    link: string
}

export function ResourceCard({ icon, title, description, link }: ResourceCardProps) {
    return (
        <Link href={link} className="group block h-full">
            <Card className="h-full transition-all hover:border-primary/50 hover:bg-muted/50">
                <CardHeader>
                    <div className="mb-2 text-4xl">{icon}</div>
                    <CardTitle className="flex items-center text-xl">
                        {title}
                        <ArrowRight className="ml-2 h-4 w-4 opacity-0 transition-all group-hover:translate-x-1 group-hover:opacity-100" />
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    <p className="text-sm text-muted-foreground">{description}</p>
                </CardContent>
            </Card>
        </Link>
    )
}
