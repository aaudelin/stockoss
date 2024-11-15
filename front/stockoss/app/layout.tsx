import type {Metadata} from "next";
import "./globals.css";


export const metadata: Metadata = {
    title: "Stockoss | Orders",
    description: "List of orders",
};

export default function RootLayout({
                                       children,
                                   }: Readonly<{
    children: React.ReactNode;
}>) {
    return (
        <html lang="fr">
        <body
            className="dark"
        >
        {children}
        </body>
        </html>
    );
}
