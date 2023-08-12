document.addEventListener('DOMContentLoaded', function() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  
    const deleteForms = document.querySelectorAll('.delete-form');
  
    deleteForms.forEach(form => {
      form.addEventListener('submit', async function(event) {
        event.preventDefault();
  
        const foodRow = form.closest('.food-row');
        const deleteUrl = form.getAttribute('action');
  
        const response = await fetch(deleteUrl, {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken // Use the retrieved CSRF token here
          }
        });
  
        if (response.ok) {
          foodRow.remove();
        }
      });
    });
  });
  