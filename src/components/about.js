"use client";
import { motion } from "framer-motion";

const About = () => {
  return (
    <motion.section
      className="w-full"
      initial={{ opacity: 0 }}
      whileInView={{ opacity: 1 }}
      transition={{ duration: 1 }}
    >
      <div className="my-20 mx-auto w-1/2 flex flex-col justify-center items-center">
        <motion.h2
          className="text-6xl font-bold text-center"
          initial={{ y: -20, opacity: 0 }}
          whileInView={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.2, duration: 0.5 }}
        >
          The first real-world blockchain dapp that provides split transactions
        </motion.h2>
      </div>
      <div className="w-full mx-auto px-20 max-w-screen-2xl grid grid-cols-1 md:grid-cols-2">
        <motion.div
          className="md:border-0 md:odd:border-r md:border-solid md:border-white/20 overflow-hidden"
          initial={{ x: -50, opacity: 0 }}
          whileInView={{ x: 0, opacity: 1 }}
          transition={{ delay: 0.4, duration: 0.5 }}
        >
          <div className="text-center h-full flex flex-col items-center md:pt-20 md:mx-[2px]">
            <div className="max-w-md flex-1 flex flex-col items-center md:px-10 lg:px-1/12 xl:px-2/12">
              <motion.h1
                className="mt-4 text-4xl"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.6, duration: 0.5 }}
              >
                Wallet with Account Abstraction
              </motion.h1>
              <motion.p
                className="mt-4"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.8, duration: 0.5 }}
              >
                Our application offers an advanced digital wallet with account abstraction, ensuring the security and privacy of users when storing their digital assets. With this functionality, users have full control over their transactions and balances without compromising security.
              </motion.p>
              
            </div>
            <div className="w-full border-b border-solid border-white/20 h-20 border-0 md:border-b"></div>
          </div>
        </motion.div>
        <motion.div
          className="md:border-0 md:odd:border-r md:border-solid md:border-white/20 overflow-hidden"
          initial={{ x: 50, opacity: 0 }}
          whileInView={{ x: 0, opacity: 1 }}
          transition={{ delay: 0.4, duration: 0.5 }}
        >
          <div className="text-center h-full flex flex-col items-center md:pt-20 md:mx-[2px]">
            <div className="max-w-md flex-1 flex flex-col md:px-10 lg:px-1/12 xl:px-2/12">
              <motion.h1
                className="mt-4 text-4xl"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.6, duration: 0.5 }}
              >
               Transactions in Installments
              </motion.h1>
              <motion.p
                className="mt-4"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.8, duration: 0.5 }}
              >
                We allow users to make transactions in installments using cryptocurrency. This means that users can split larger payments into smaller payments over time, providing greater financial flexibility and facilitating the acquisition of goods and services.
              </motion.p>
            </div>
            <div className="w-full border-b border-solid border-white/20 h-20 border-0 md:border-b"></div>
          </div>
        </motion.div>
        <motion.div
          className="md:border-0 md:odd:border-r md:border-solid md:border-white/20 overflow-hidden"
          initial={{ x: -50, opacity: 0 }}
          whileInView={{ x: 0, opacity: 1 }}
          transition={{ delay: 0.4, duration: 0.5 }}
        >
          <div className="text-center h-full flex flex-col items-center md:pt-20 md:mx-[2px]">
            <div className="max-w-md flex-1 flex flex-col md:px-10 lg:px-1/12 xl:px-2/12">
              <motion.h1
                className="mt-4 text-4xl"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.6, duration: 0.5 }}
              >
                Ease of Use and Accessibility
              </motion.h1>
              <motion.p
                className="mt-4"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.8, duration: 0.5 }}
              >
               Our application has been developed with a focus on ease of use and accessibility. Users can easily set up installment transactions by defining the total transaction amount, the number of installments, and the desired payment intervals, all with just a few clicks.
              </motion.p>
            </div>
            <div className="w-full border-0 border-solid border-white/20 h-20 border-b md:border-0"></div>
          </div>
        </motion.div>
        <motion.div
          className="md:border-0 md:odd:border-r md:border-solid md:border-white/20 overflow-hidden"
          initial={{ x: 50, opacity: 0 }}
          whileInView={{ x: 0, opacity: 1 }}
          transition={{ delay: 0.4, duration: 0.5 }}
        >
          <div className="text-center h-full flex flex-col items-center md:pt-20 md:mx-[2px]">
            <div className="max-w-md flex-1 flex flex-col md:px-10 lg:px-1/12 xl:px-2/12">
              <motion.h1
                className="mt-4 text-4xl"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.6, duration: 0.5 }}
              >
               Security and Privacy
              </motion.h1>
              <motion.p
                className="mt-4"
                initial={{ y: -20, opacity: 0 }}
                whileInView={{ y: 0, opacity: 1 }}
                transition={{ delay: 0.8, duration: 0.5 }}
              >
                We prioritize the security and privacy of users in all transactions. We use advanced encryption and data protection technologies to ensure that users' financial information remains secure and confidential throughout the entire process of installment transactions with cryptocurrency.
              </motion.p>
            </div>
            <div className="w-full border-0 border-solid border-white/20 h-20 border-b md:border-0"></div>
          </div>
        </motion.div>
      </div>
    </motion.section>
  );
};

export default About;
