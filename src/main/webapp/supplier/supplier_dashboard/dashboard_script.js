document.addEventListener('DOMContentLoaded', () => {
    fetch('/Supply-chain-and-Logistic/SupplierOrderServlet', {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        console.log('Orders fetched:', data);
        
        const tableBody = document.querySelector('#supplierOrdersTable tbody');
        tableBody.innerHTML = '';

        data.forEach(row => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${row.order_id}</td>
                <td>${row.order_date}</td>
                <td class="${row.status.toLowerCase()}">${row.status}</td>
                <td>${row.order_amount}</td>
                <td><a href="order-details.html">Agreement</a></td>
            `;
            tableBody.appendChild(tr);
        });
    })
    .catch(error => console.error('Error fetching supplier orders:', error));
});
