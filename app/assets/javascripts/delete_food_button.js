document.addEventListener('DOMContentLoaded', function() {
    const deleteForms = document.querySelectorAll('.delete-form');
  
    deleteForms.forEach(form => {
      form.addEventListener('submit', async function(event) {
        event.preventDefault();
  
        const foodRow = form.closest('.food-row');
        const deleteUrl = form.getAttribute('action');
        const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  
        const response = await fetch(deleteUrl, {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken
          }
        });
  
        if (response.ok) {
          foodRow.remove();
        }
      });
    });
  });
  