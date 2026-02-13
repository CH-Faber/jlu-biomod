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
        year: "2024",
        title: "BIOMOD 2024 项目",
        description: "探索最新的生物分子设计与创新应用",
        award: "参赛作品",
        image: "",
        link: "/archive/2024/index.html",
        color: "text-blue-400",
    },
    {
        year: "2023",
        title: "BIOMOD 2023 项目",
        description: "基于 DNA 纳米技术的创新设计",
        award: "参赛作品",
        image: "",
        link: "/archive/2023/index2.html",
        color: "text-indigo-400",
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
    {
        year: "2017",
        title: "BIOMOD 2017 项目",
        description: "生物分子机器的设计与应用",
        award: "Gold Project",
        image: "",
        link: "/archive/2017/index.html",
        color: "text-pink-400",
    },
    {
        year: "2016",
        title: "Nano-JLU 2016",
        description: "A two-dimensional supramolecular material formed by G-quadroplex and tetrahedral DNA",
        award: "Gold Project",
        image: "",
        link: "/archive/2016/index.html",
        color: "text-orange-400",
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
