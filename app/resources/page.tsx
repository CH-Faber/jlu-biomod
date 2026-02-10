import { resourceCategories } from "@/lib/data"
import { ResourceCard } from "@/components/ResourceCard"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

export default function ResourcesPage() {
    return (
        <div className="container py-12 md:py-24 px-4 md:px-8 mx-auto">
            <div className="mb-12 space-y-4">
                <h1 className="text-3xl font-bold tracking-tighter sm:text-4xl md:text-5xl">资源共享中心</h1>
                <p className="max-w-[700px] text-muted-foreground md:text-xl">
                    汇集生物纳米技术领域的精选文献、设计工具与实验素材。
                </p>
            </div>

            <Tabs defaultValue="all" className="space-y-8">
                <TabsList className="grid w-full grid-cols-4 lg:w-[400px]">
                    <TabsTrigger value="all">全部</TabsTrigger>
                    <TabsTrigger value="docs">文献</TabsTrigger>
                    <TabsTrigger value="tools">工具</TabsTrigger>
                    <TabsTrigger value="assets">素材</TabsTrigger>
                </TabsList>

                <TabsContent value="all" className="space-y-8">
                    <div className="grid gap-6 md:grid-cols-3">
                        {resourceCategories.map((category) => (
                            <ResourceCard
                                key={category.title}
                                {...category}
                            />
                        ))}
                    </div>
                </TabsContent>

                <TabsContent value="docs">
                    <div className="rounded-lg border bg-card text-card-foreground shadow-sm p-12 text-center text-muted-foreground">
                        在此查看历年 Wiki 文档与核心论文... (Content Placeholder)
                    </div>
                </TabsContent>
                <TabsContent value="tools">
                    <div className="rounded-lg border bg-card text-card-foreground shadow-sm p-12 text-center text-muted-foreground">
                        Cadnano, PyMOL 等常用设计软件... (Content Placeholder)
                    </div>
                </TabsContent>
                <TabsContent value="assets">
                    <div className="rounded-lg border bg-card text-card-foreground shadow-sm p-12 text-center text-muted-foreground">
                        团队 Logo, PPT 模板下载... (Content Placeholder)
                    </div>
                </TabsContent>
            </Tabs>
        </div>
    )
}
