"use client";

import { motion } from 'framer-motion';

const Join = () => {
    return (
        <motion.section
            className="w-full"
            initial={{ opacity: 0 }}
            whileInView={{ opacity: 1 }}
            transition={{ duration: 0.5 }}
        >
            <div className="w-full mx-auto my-5 px-20 max-w-screen-2xl">
                <motion.div
                    className="flex flex-col items-center justify-center md:flex-row w-full h-[40rem] my-5 p-20 rounded-2xl md:rounded-[32px] max-w-screen-2xl bg-gradient-to-r from-ibase to-hbase text-dbase"
                    initial={{ scale: 0 }}
                    whileInView={{ scale: 1 }}
                    transition={{ delay: 0.2, duration: 0.5 }}
                >
                    <motion.div
                        className="flex-1 order-2 md:order-1 flex flex-col items-center justify-center"
                        initial={{ y: -20, opacity: 0 }}
                        whileInView={{ y: 0, opacity: 1 }}
                        transition={{ delay: 0.4, duration: 0.5 }}
                    >
                        <p className="tw-lead text-ebase md:text-6xl md:tw-title-sm mb-10 text-center font-bold">
                            Become a part of the community and get rewards.
                        </p>
                        <motion.button
                            className="w-2/3 h-14 mt-4 py-1 px-3 font-bold bg-gray-700/30 text-ebase rounded-lg hover:bg-gray-/40 active:bg-gray-700/80 active:text-ebase"
                            initial={{ y: -20, opacity: 0 }}
                            whileInView={{ y: 0, opacity: 1 }}
                            transition={{ delay: 0.6, duration: 0.5 }}
                        >
                            JOIN
                        </motion.button>
                    </motion.div>
                    <motion.div
                        className="flex-1 order-1 md:order-2 mt-10 md:mt-0 aspect-[821/750]"
                        initial={{ scale: 0 }}
                        whileInView={{ scale: 1 }}
                        transition={{ delay: 0.2, duration: 0.5 }}
                    ></motion.div>
                </motion.div>
            </div>
        </motion.section>
    );
};

export default Join;
