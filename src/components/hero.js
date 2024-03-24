"use client";

import { motion } from 'framer-motion'
import Link from 'next/link'

const HeroSection = () => {
    return (
        <section className="h-screen w-full bg-black/50 flex flex-col items-center justify-center">
            <motion.div
                initial={{ opacity: 0 }}
                whileInView={{ opacity: 1 }}
                transition={{ duration: 1 }}
                className="flex flex-col items-center justify-center max-w-7xl"
            >
                <h1 className="text-7xl md:text-9xl font-bold mb-4 text-center">
                    ZoBooWallet
                </h1>
                <p className="text-4xl md:text-6xl font-bold mb-8 text-center">A new payment method</p>
                <div className="flex gap-10 my-40">
                    <motion.div className='/' whileHover={{ scale: 1.1 }}>
                       <Link href="https://appetize.io/app/ycc5turbksgderd3s2wnxu4yqq" className="bg-black/20 hover:bg-white/20 text-ebase font-bold py-10 px-20 border border-solid border-black hover:border-white rounded-2xl">
                            Launch App
                        </Link>  
                   </motion.div>
                   <motion.div className='/' whileHover={{ scale: 1.1 }}>
                   <Link href="/" className="bg-black/20 hover:bg-white/20 text-ebase font-bold py-10 px-20 border border-solid border-black hover:border-white rounded-2xl">
                            Install Apk
                        </Link>  
                   </motion.div>
                </div>
            </motion.div>
        </section>
    )
}

export default HeroSection
