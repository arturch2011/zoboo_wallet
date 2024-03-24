"use client";

import { useState } from 'react'
import { motion, useReducedMotion } from 'framer-motion'

const Expandable = () => {
    const [showContent, setShowContent] = useState({
        div1: false,
        div2: false,
        div3: false,
        div4: false,
    })

    const handleDivClick = (div) => {
        // Verificar o estado atual da div clicada
        const isCurrentlyOpen = showContent[div]

        // Fechar todas as divs
        const updatedShowContent = {
            div1: false,
            div2: false,
            div3: false,
            div4: false,
        }

        // Abrir a div clicada, se ela estiver fechada
        if (!isCurrentlyOpen) {
            updatedShowContent[div] = true
        }

        // Atualizar o estado
        setShowContent(updatedShowContent)
    }

    return (
        <section className="w-full mb-60">
            <div className="w-full mx-auto text-center max-w-screen-2xl my-16 md:pt-20">
                <h2 className="text-6xl font-bold">Expand your payment methods with our DApp</h2>
            </div>

            {/* Div 1 */}
            <div className="w-full mx-auto my-5 px-20 max-w-screen-2xl">
                <div className="bg-white/5 rounded-xl md:rounded-[32px] px-6 md:px-10 py-6 md:py-12">
                    <motion.button
                        onClick={() => handleDivClick('div1')}
                        className="w-full flex justify-between items-center bg-transparent appearance-none border-none p-0"
                        initial={{ opacity: 0 }}
                        whileInView={{ opacity: 1 }}
                        transition={{ delay: 0.2, duration: 0.5 }}
                    >
                        <h3 className="text-4xl font-bold mb-0">Wallet with Account Abstraction</h3>
                        <motion.svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="36"
                            height="37"
                            viewBox="0 0 36 37"
                            fill="none"
                            className="transition-transform w-6 md:w-9"
                            initial={{ rotate: 0 }}
                            animate={{ rotate: showContent.div1 ? 180 : 0 }}
                            transition={{ duration: 0.3 }}
                        >
                            <path
                                d="M5.67578 12.5884L17.999 24.9116L30.3223 12.5884"
                                stroke="white"
                                strokeOpacity="0.6"
                                strokeWidth="3"
                            ></path>
                        </motion.svg>
                    </motion.button>

                    {showContent.div1 && (
                        <motion.div
                            className="transition-all overflow-hidden max-h-none"
                            initial={{ height: 0 }}
                            animate={{ height: 'auto' }}
                            transition={{ duration: 0.3 }}
                        >
                            <div className="flex flex-col md:flex-row">
                                <div className="flex-1 pt-5 md:pt-20 order-2 md:order-1 flex flex-col justify-center">
                                    <p className="tw-lead text-2xl md:tw-title-sm mb-10 text-ebase font-bold"> 
                                    Account abstraction is a cutting-edge feature implemented in our digital wallet application to provide an extra layer of security and privacy for users managing their digital assets. Let's delve into more detail about how this functionality works and the benefits it offers:
                                    </p>
                                    <p className="tw-lead text-ebase font-bold md:tw-title-sm mb-10">
                                    Account abstraction essentially separates the account details from the underlying blockchain. This means that while users interact with their accounts through the wallet interface, the actual account information is not directly visible or stored on the blockchain.
                                    Instead of using traditional public addresses that are directly associated with user accounts, account abstraction employs advanced cryptographic techniques to manage and verify transactions without revealing sensitive account information.
                                    </p>
                                </div>
                                <div className="flex-1 order-1 md:order-2 mt-10 md:mt-0 aspect-[821/750]">
                                    <div>
                                        <img
                                            src="global-reach-image.jpg"
                                            alt="Global Reach"
                                            className="w-full h-full object-cover rounded-lg"
                                        />
                                    </div>
                                </div>
                            </div>
                        </motion.div>
                    )}
                </div>
            </div>

            {/* Div 2 */}
            <div className="w-full mx-auto my-5 px-20 max-w-screen-2xl">
                <div className="bg-white/5 rounded-xl md:rounded-[32px] px-6 md:px-10 py-6 md:py-12">
                    <motion.button
                        onClick={() => handleDivClick('div2')}
                        className="w-full flex justify-between items-center bg-transparent appearance-none border-none p-0"
                        initial={{ opacity: 0 }}
                        whileInView={{ opacity: 1 }}
                        transition={{ delay: 0.4, duration: 0.5 }}
                    >
                        <h3 className="text-4xl font-bold mb-0">Installment Transactions</h3>
                        <motion.svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="36"
                            height="37"
                            viewBox="0 0 36 37"
                            fill="none"
                            className="transition-transform w-6 md:w-9"
                            initial={{ rotate: 0 }}
                            animate={{ rotate: showContent.div2 ? 180 : 0 }}
                            transition={{ duration: 0.3 }}
                        >
                            <path
                                d="M5.67578 12.5884L17.999 24.9116L30.3223 12.5884"
                                stroke="white"
                                strokeOpacity="0.6"
                                strokeWidth="3"
                            ></path>
                        </motion.svg>
                    </motion.button>

                    {showContent.div2 && (
                        <motion.div
                            className="transition-all overflow-hidden max-h-none"
                            initial={{ height: 0 }}
                            animate={{ height: 'auto' }}
                            transition={{ duration: 0.3 }}
                        >
                            <div className="flex flex-col md:flex-row">
                                <div className="flex-1 pt-5 md:pt-20 order-2 md:order-1 flex flex-col justify-center">
                                    <p className="tw-lead text-2xl md:tw-title-sm mb-10 text-ebase font-bold">
                                    We allow users to make installment transactions using cryptocurrency. This means that users can split larger payments into smaller payments over time, providing greater financial flexibility and facilitating the acquisition of goods and services.
                                    </p>
                                    <p className="tw-lead text-xl font-bold md:tw-title-sm mb-10">
                                    With installment transactions, users have the freedom to divide the cost of a significant purchase into smaller payments, making the acquisition of higher-value goods and services more accessible.
                                    This financial flexibility is particularly useful for users who wish to make purchases beyond their immediate budget, allowing them to spread the costs over time according to their needs and financial capacity.
                                    </p>
                                </div>
                                <div className="flex-1 order-1 md:order-2 mt-10 md:mt-0 aspect-[821/750]">
                                    <div>
                                        <img
                                            src="enhanced-security-image.jpg"
                                            alt="Enhanced Security"
                                            className="w-full h-full object-cover rounded-lg"
                                        />
                                    </div>
                                </div>
                            </div>
                        </motion.div>
                    )}
                </div>
            </div>

            {/* Div 3 */}
            <div className="w-full mx-auto my-5 px-20 max-w-screen-2xl">
                <div className="bg-white/5 rounded-xl md:rounded-[32px] px-6 md:px-10 py-6 md:py-12">
                    <motion.button
                        onClick={() => handleDivClick('div3')}
                        className="w-full flex justify-between items-center bg-transparent appearance-none border-none p-0"
                        initial={{ opacity: 0 }}
                        whileInView={{ opacity: 1 }}
                        transition={{ delay: 0.6, duration: 0.5 }}
                    >
                        <h3 className="text-4xl font-bold mb-0">Ease of Use and Accessibility</h3>
                        <motion.svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="36"
                            height="37"
                            viewBox="0 0 36 37"
                            fill="none"
                            className="transition-transform w-6 md:w-9"
                            initial={{ rotate: 0 }}
                            animate={{ rotate: showContent.div3 ? 180 : 0 }}
                            transition={{ duration: 0.3 }}
                        >
                            <path
                                d="M5.67578 12.5884L17.999 24.9116L30.3223 12.5884"
                                stroke="white"
                                strokeOpacity="0.6"
                                strokeWidth="3"
                            ></path>
                        </motion.svg>
                    </motion.button>

                    {showContent.div3 && (
                        <motion.div
                            className="transition-all overflow-hidden max-h-none"
                            initial={{ height: 0 }}
                            animate={{ height: 'auto' }}
                            transition={{ duration: 0.3 }}
                        >
                            <div className="flex flex-col md:flex-row">
                                <div className="flex-1 pt-5 md:pt-20 order-2 md:order-1 flex flex-col justify-center">
                                    <p className="tw-lead text-2xl md:tw-title-sm mb-10 text-ebase font-bold">
                                    Our application is designed with a primary focus on ensuring ease of use and accessibility for all users. Here's how we achieve that:
                                    </p>
                                    <p className="tw-lead text-xl font-bold md:tw-title-sm mb-10">
                                    Our interface is intuitive and user-friendly, making it easy for users of all levels of expertise to navigate through the application seamlessly.
                                    Setting up installment transactions is straightforward and hassle-free. Users can define the total transaction amount, the number of installments, and the desired payment intervals with just a few clicks.
                                    Our application is accessible across various devices, including smartphones, tablets, and desktop computers. This ensures that users can manage their installment transactions conveniently, regardless of the device they are using.
                                    </p>
                                </div>
                                <div className="flex-1 order-1 md:order-2 mt-10 md:mt-0 aspect-[821/750]">
                                    <div>
                                        <img
                                            src="efficient-transactions-image.jpg"
                                            alt="Efficient Transactions"
                                            className="w-full h-full object-cover rounded-lg"
                                        />
                                    </div>
                                </div>
                            </div>
                        </motion.div>
                    )}
                </div>
            </div>

            <div className="w-full mx-auto my-5 px-20 max-w-screen-2xl">
                <div className="bg-white/5 rounded-xl md:rounded-[32px] px-6 md:px-10 py-6 md:py-12">
                    <motion.button
                        onClick={() => handleDivClick('div4')}
                        className="w-full flex justify-between items-center bg-transparent appearance-none border-none p-0"
                        initial={{ opacity: 0 }}
                        whileInView={{ opacity: 1 }}
                        transition={{ delay: 0.6, duration: 0.5 }}
                    >
                        <h3 className="text-4xl font-bold mb-0">Security and Privacy</h3>
                        <motion.svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="36"
                            height="37"
                            viewBox="0 0 36 37"
                            fill="none"
                            className="transition-transform w-6 md:w-9"
                            initial={{ rotate: 0 }}
                            animate={{ rotate: showContent.div4 ? 180 : 0 }}
                            transition={{ duration: 0.3 }}
                        >
                            <path
                                d="M5.67578 12.5884L17.999 24.9116L30.3223 12.5884"
                                stroke="white"
                                strokeOpacity="0.6"
                                strokeWidth="3"
                            ></path>
                        </motion.svg>
                    </motion.button>

                    {showContent.div4 && (
                        <motion.div
                            className="transition-all overflow-hidden max-h-none"
                            initial={{ height: 0 }}
                            animate={{ height: 'auto' }}
                            transition={{ duration: 0.3 }}
                        >
                            <div className="flex flex-col md:flex-row">
                                <div className="flex-1 pt-5 md:pt-20 order-2 md:order-1 flex flex-col justify-center">
                                    <p className="tw-lead text-2xl md:tw-title-sm mb-10 text-ebase font-bold">
                                    At the core of our application, we place the utmost importance on the security and privacy of our users in every transaction. Here's how we ensure their protection:
                                    </p>
                                    <p className="tw-lead text-xl font-bold md:tw-title-sm mb-10">
                                    We employ state-of-the-art encryption technology to safeguard users' financial information. This encryption ensures that all data transmitted between the user's device and our servers remains confidential and inaccessible to unauthorized parties.
                                    Our platform incorporates robust data protection measures to prevent unauthorized access to users' sensitive information. We implement industry best practices for data storage and management to maintain the integrity and confidentiality of user data.
                                    When conducting installment transactions with cryptocurrency, we utilize secure blockchain protocols to ensure the integrity and authenticity of each transaction. This helps prevent fraud and unauthorized tampering with transaction data.
                                    </p>
                                </div>
                                <div className="flex-1 order-1 md:order-2 mt-10 md:mt-0 aspect-[821/750]">
                                    <div>
                                        <img
                                            src="efficient-transactions-image.jpg"
                                            alt="Efficient Transactions"
                                            className="w-full h-full object-cover rounded-lg"
                                        />
                                    </div>
                                </div>
                            </div>
                        </motion.div>
                    )}
                </div>
            </div>
        </section>
    )
}

export default Expandable
