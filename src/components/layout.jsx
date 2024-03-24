import Footer from './layout/footer'
import Navbar from './layout/navbar'


const Layout = ({ children }) => {
    return (
        <div className="content">
            <Navbar />
            {/* <Menu /> */}
            {children}
            <Footer />
        </div>
    )
}

export default Layout
