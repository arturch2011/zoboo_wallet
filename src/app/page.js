import Image from "next/image";
import Head from 'next/head'

import HeroSection from '@/components/hero'
import About from '@/components/about'
import Expandable from '@/components/expandable'
import Join from '@/components/join'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between bg-[url(../../public/images/bgimage.webp)] bg-cover bg-fixed bg-center">
                <HeroSection />

                <section className="w-full pb-20 backdrop-blur-xl bg-gradient-to-b from-gbase/50 to-base">
                    <About />
                    <Expandable />
                    <Join />
                </section>
            </main>
  );
}
