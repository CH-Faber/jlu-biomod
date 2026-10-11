"use client"

import * as React from "react"
import Link from "next/link"
import { Leaf, Menu } from "lucide-react"

import { Button } from "@/components/ui/button"
import {
    Sheet,
    SheetContent,
    SheetTrigger,
} from "@/components/ui/sheet"
import { ThemeToggle } from "@/components/ThemeToggle"

export function Navbar() {
    const [isOpen, setIsOpen] = React.useState(false)

    const navItems = [
        { name: "首页", href: "/" },
        { name: "历年作品", href: "/archive" },
        { name: "资源库", href: "/resources" },
        { name: "团队成员", href: "/#team" },
    ]

    return (
        <header className="plant-nav sticky top-0 z-50 w-full">
            <div className="plant-nav__inner container px-4 md:px-8 flex h-[76px] items-center justify-between mx-auto">
                <Link href="/" prefetch={false} className="plant-nav__brand flex items-center gap-2">
                    <Leaf className="h-5 w-5" aria-hidden="true" />
                    <span className="text-xl font-bold">
                        JLU-BIOMOD
                    </span>
                </Link>

                {/* Desktop Nav */}
                <nav className="plant-nav__links hidden md:flex items-center gap-7" aria-label="主导航">
                    {navItems.map((item) => (
                        <a
                            key={item.href}
                            href={item.href}
                            className="plant-nav__link text-sm font-medium text-muted-foreground transition-colors hover:text-primary"
                        >
                            {item.name}
                        </a>
                    ))}
                    <span className="plant-nav__theme"><ThemeToggle /></span>
                </nav>

                {/* Mobile Nav */}
                <div className="flex items-center gap-4 md:hidden">
                    <ThemeToggle />
                    <Sheet open={isOpen} onOpenChange={setIsOpen}>
                        <SheetTrigger asChild>
                            <Button variant="ghost" size="icon">
                                <Menu className="h-5 w-5" />
                                <span className="sr-only">Toggle menu</span>
                            </Button>
                        </SheetTrigger>
                        <SheetContent side="right">
                            <div className="flex flex-col gap-4 mt-8">
                                {navItems.map((item) => (
                                    <a
                                        key={item.href}
                                        href={item.href}
                                        className="text-lg font-medium"
                                        onClick={() => setIsOpen(false)}
                                    >
                                        {item.name}
                                    </a>
                                ))}
                            </div>
                        </SheetContent>
                    </Sheet>
                </div>
            </div>
        </header>
    )
}
