function updatePrice() {
    const eventSelect = document.getElementById('eventID');
    const quantitySelect = document.getElementById('quantity');
    const totalPriceDisplay = document.getElementById('totalPrice');
    const totalPriceInput = document.getElementById('totalPriceInput');

    const selectedOption = eventSelect.options[eventSelect.selectedIndex];
    const price = selectedOption ? parseFloat(selectedOption.getAttribute('data-price')) : 0;
    const quantity = parseInt(quantitySelect.value) || 1;
    const total = (price * quantity).toFixed(2);

    totalPriceDisplay.textContent = `Total Price: $${total}`;
    totalPriceInput.value = total;

    // Add animation effect
    totalPriceDisplay.classList.add('price-update');
    setTimeout(() => {
        totalPriceDisplay.classList.remove('price-update');
    }, 300);
}


document.addEventListener('DOMContentLoaded', function() {
    updatePrice();


    const formElements = document.querySelectorAll('.ticket-form > *');
    formElements.forEach((el, index) => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = `opacity 0.5s ease ${index * 0.1}s, transform 0.5s ease ${index * 0.1}s`;
        setTimeout(() => {
            el.style.opacity = '1';
            el.style.transform = 'translateY(0)';
        }, 100);
    });
});