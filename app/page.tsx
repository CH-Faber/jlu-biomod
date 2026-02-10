import Link from "next/link"
import { ArrowRight } from "lucide-react"
import { Button } from "@/components/ui/button"
import { projects, resourceCategories } from "@/lib/data"
import { ArchiveCard } from "@/components/ArchiveCard"
import { ResourceCard } from "@/components/ResourceCard"

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen">
      {/* Hero Section */}
      <section className="relative flex min-h-[80vh] flex-col items-center justify-center overflow-hidden border-b bg-background px-4 py-24 text-center md:px-8">
        {/* Background Gradient */}
        <div className="absolute inset-0 -z-10 bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-sky-400/20 via-background to-background dark:from-sky-900/20" />

        <div className="container max-w-4xl space-y-6 mx-auto">
          <div className="inline-flex items-center rounded-full border bg-background/50 px-3 py-1 text-sm font-medium backdrop-blur-sm">
            <span className="flex h-2 w-2 rounded-full bg-sky-500 mr-2 animate-pulse" />
            Jilin University BIOMOD Team
          </div>
          <h1 className="text-4xl font-extrabold tracking-tight sm:text-6xl md:text-7xl">
            探索微观世界的 <br className="hidden sm:inline" />
            <span className="bg-gradient-to-r from-sky-400 to-violet-500 bg-clip-text text-transparent">
              纳米工程师
            </span>
          </h1>
          <p className="mx-auto max-w-2xl text-lg text-muted-foreground sm:text-xl">
            我们致力于分子机器人与生物纳米技术的研究。在这里，你可以浏览我们在 BIOMOD 国际竞赛中的获奖作品，获取学习资源，并了解我们的科研故事。
          </p>
          <div className="flex flex-col items-center justify-center gap-4 sm:flex-row">
            <Button asChild size="lg" className="h-12 w-full px-8 sm:w-auto text-base">
              <Link href="/archive">
                浏览历年作品 <ArrowRight className="ml-2 h-4 w-4" />
              </Link>
            </Button>
            <Button asChild variant="outline" size="lg" className="h-12 w-full px-8 sm:w-auto text-base">
              <Link href="/resources">
                访问资源库
              </Link>
            </Button>
          </div>
        </div>
      </section>

      {/* Archive Preview */}
      <section className="container px-4 py-24 md:px-8 mx-auto">
        <div className="mb-12 flex flex-col items-start justify-between gap-4 md:flex-row md:items-end">
          <div className="space-y-1">
            <h2 className="text-3xl font-bold tracking-tight">历年参赛项目</h2>
            <p className="text-muted-foreground">回顾我们在国际生物分子设计大赛中的精彩瞬间。</p>
          </div>
          <Button asChild variant="ghost">
            <Link href="/archive">
              查看全部 <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </Button>
        </div>
        <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {projects.map((project) => (
            <ArchiveCard key={project.year} project={project} />
          ))}
        </div>
      </section>

      {/* Resource Preview */}
      <section className="border-t bg-muted/40">
        <div className="container px-4 py-24 md:px-8 mx-auto">
          <div className="mb-12 text-center">
            <h2 className="text-3xl font-bold tracking-tight">学习资源中心</h2>
            <p className="mt-2 text-muted-foreground">为生物纳米技术初学者和研究者提供的精选资料。</p>
          </div>
          <div className="grid gap-6 md:grid-cols-3">
            {resourceCategories.map((category) => (
              <ResourceCard
                key={category.title}
                {...category}
              />
            ))}
          </div>
        </div>
      </section>
    </div>
  )
}
