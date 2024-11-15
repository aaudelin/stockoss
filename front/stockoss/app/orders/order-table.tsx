"use client"

import {ColumnDef} from "@tanstack/table-core";
import {Button} from "@/components/ui/button";
import Link from 'next/link'
import {EyeIcon} from "lucide-react";


export type OrderLink = {
    self: string;
    lines: string;
}

export type Order = {
    id: number;
    label: string;
    customer: string;
    status: string;
    links: OrderLink;
}

export const columns: ColumnDef<Order>[] = [
    {
        accessorKey: 'id',
        header: 'ID',
    },
    {
        accessorKey: 'label',
        header: 'Label',
    },
    {
        accessorKey: 'customer',
        header: 'Customer',
    },
    {
        accessorKey: 'status',
        header: 'Status',
    },
    {
        id: "view",
        cell: ({row}) => {
            const lines = row.original.links.lines
            if (!lines) return <></>
            return (
                <Link href={lines}>
                    <Button variant="outline" size="icon">
                        <EyeIcon/>
                    </Button>
                </Link>

            )
        }
    }
];

