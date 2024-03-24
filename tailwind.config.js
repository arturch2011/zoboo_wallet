/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        dblue: '#0A192F',
        blue: '#64C9CF',
        amber: '#F0B90B',
        camber: '#FCD34D',
        background: '#191B1F',
        primary: '#700099',
        cprimary: '#C936FF',
        dprimary: '#480063',
        base: '#374151',
        cbase: '#4B5563',
        dbase: '#111928',
        ebase: '#FFE800',
        fbase: '#FCEC47',
        gbase: '#999999',
        hbase: '#FFF9C1',
        ibase: '#BFBA8F',
    },
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic":
          "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
    },
  },
  plugins: [],
};
