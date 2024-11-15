import {Button} from "@/components/ui/button";
import {columns, Order} from "@/app/orders/order-table";
import {DataTable} from "@/app/orders/data-table";

async function getOrders(): Promise<Order[]> {
    const response = await fetch('http://localhost:3000/rest/orders');
    const data = await response.json();
    return data.orders;
}

export default async function Home() {
    const data = await getOrders();

    console.log(data);

    return (
        <main className="container mx-auto py-10">
            <h1 className="text-4xl font-bold">Stockoss OMS</h1>
            <div className="my-12">
                <DataTable columns={columns} data={data}/>
            </div>
            <Button>Click me</Button>
        </main>
    );
}
