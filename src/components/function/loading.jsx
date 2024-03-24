import React from 'react';
import { motion } from 'framer-motion';

const LoadingShape = ({ color }) => {
    const shapeVariants = {
        square: {
            borderRadius: '0%',
            rotate: 0,
        },
        triangle: {
            borderRadius: '50%',
            rotate: 120,
        },
    };

    return (
        <div className="fixed top-0 left-0 right-0 bottom-0 flex justify-center items-center bg-black/75 backdrop-blur-2xl z-40">
            <motion.div
                className="w-40 h-40"
                style={{ backgroundColor: color }}
                variants={shapeVariants}
                animate="triangle"
                transition={{
                    duration: 1,
                    repeat: Infinity,
                    repeatType: 'reverse',
                    ease: 'easeInOut',
                }}
            ></motion.div>
        </div>
    );
};

export default LoadingShape;
