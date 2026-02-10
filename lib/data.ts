export interface Project {
    year: string
    title: string
    description: string
    image: string
    link: string
    award?: string
    color: string // For accent color
}

export const projects: Project[] = [
    {
        year: "2025",
        title: "纳米折纸病毒陷阱",
        description: "针对流感病毒的特异性捕获与检测系统",
        award: "Gold Medal",
        image: "", // Placeholder
        link: "/archive/2025/index.html",
        color: "text-cyan-400",
    },
    {
        year: "2019",
        title: "NANO-JLU 分子引擎",
        description: "可控运动的纳米级分子马达设计",
        award: "Grand Prize",
        image: "",
        link: "/archive/2019/Home.html",
        color: "text-emerald-400",
    },
    {
        year: "2018",
        title: "早期探索项目",
        description: "BIOMOD 2018 参赛作品",
        award: "Silver Medal",
        image: "",
        link: "/archive/2018/Home.html",
        color: "text-violet-500",
    },
]

export const resourceCategories = [
    {
        icon: "📄",
        title: "文献资料",
        description: "精选论文、核心概念、历年 Wiki 文档",
        link: "/resources",
    },
    {
        icon: "🛠️",
        title: "工具箱",
        description: "Cadnano 设计软件、PyMOL 可视化、序列编辑器",
        link: "/resources",
    },
    {
        icon: "🧬",
        title: "素材库",
        description: "团队 Logo、3D 模型、答辩 PPT 模板",
        link: "/resources",
    },
]
