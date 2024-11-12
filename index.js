const primaryColor = '#4834d4';
const warningColor = '#f0932b';
const successColor = '#6ab04c';
const dangerColor = '#eb4d4b';

const themeCookieName = 'theme';
const themeDark = 'dark';
const themeLight = 'light';

const body = document.getElementsByTagName('body')[0];

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

loadTheme();

function loadTheme() {
  var theme = getCookie(themeCookieName);
  body.classList.add(theme === "" ? themeLight : theme);
}

function switchTheme() {
  if (body.classList.contains(themeLight)) {
    body.classList.remove(themeLight);
    body.classList.add(themeDark);
    setCookie(themeCookieName, themeDark);
  } else {
    body.classList.remove(themeDark);
    body.classList.add(themeLight);
    setCookie(themeCookieName, themeLight);
  }
}

function collapseSidebar() {
  body.classList.toggle('sidebar-expand');
}

window.onclick = function(event) {
  openCloseDropdown(event);
}

function closeAllDropdown() {
  var dropdowns = document.getElementsByClassName('dropdown-expand');
  for (var i = 0; i < dropdowns.length; i++) {
    dropdowns[i].classList.remove('dropdown-expand');
  }
}

function openCloseDropdown(event) {
  if (!event.target.matches('.dropdown-toggle')) {
    closeAllDropdown();
  } else {
    var toggle = event.target.dataset.toggle;
    var content = document.getElementById(toggle);
    if (content.classList.contains('dropdown-expand')) {
      closeAllDropdown();
    } else {
      closeAllDropdown();
      content.classList.add('dropdown-expand');
    }
  }
}

// New JavaScript for dynamic content loading
document.addEventListener('DOMContentLoaded', function() {
  const links = document.querySelectorAll('.sidebar-nav-link');
  const sections = document.querySelectorAll('.content-section');

  links.forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const contentId = this.getAttribute('data-content');

      // Hide all sections
      sections.forEach(section => section.style.display = 'none');

      // Show the selected section
      document.getElementById(contentId).style.display = 'block';

      // Update active class
      links.forEach(l => l.classList.remove('active'));
      this.classList.add('active');

      // Update the URL without reloading the page
      history.pushState(null, '', `?section=${contentId}`);
    });
  });

  // Check URL parameter to show the correct section on page load
  const urlParams = new URLSearchParams(window.location.search);
  const section = urlParams.get('section') || 'home'; // Default to 'home' if no section is specified
  showSection(section);
});

function showSection(section) {
  // Hide all sections
  document.querySelectorAll('.content-section').forEach(section => section.style.display = 'none');

  // Show the selected section
  document.getElementById(section).style.display = 'block';

  // Update sidebar highlighting
  document.querySelectorAll('.sidebar-nav-link').forEach(link => link.classList.remove('active'));
  document.querySelector(`.sidebar-nav-link[data-content="${section}"]`).classList.add('active');
}

// JavaScript for Edit and Delete Modals with AJAX
function openEditModal(userId) {
  // Fetch user data and populate the form using AJAX
  fetch(`php/get_user.php?id=${userId}`)
    .then(response => response.json())
    .then(data => {
      document.getElementById('editUserId').value = data.id;
      document.getElementById('editFirstName').value = data.first_name;
      document.getElementById('editLastName').value = data.last_name;
      document.getElementById('editUsername').value = data.username;
      document.getElementById('editEmail').value = data.email;
      document.getElementById('editRole').value = data.role;
      document.getElementById('editStatus').value = data.status;
      document.getElementById('profilePicturePreview').src = `uploads/${data.image}`;
      document.getElementById('editModal').style.display = 'block';
      document.getElementById('backdrop').style.display = 'block';
    })
    .catch(error => console.error('Error fetching user data:', error));
}

function openProfileEditModal() {
  openEditModal(userId); // Use the same function with the current user's ID
}

function closeEditModal() {
  document.getElementById('editModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

//end of edit modal

document.getElementById('editForm').addEventListener('submit', function(event) {
  event.preventDefault();
  const formData = new FormData(this);
  fetch('php/update_user.php', {
    method: 'POST',
    body: formData
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('User updated successfully');
        reloadUsersSection(); // Reload the Users section
      } else {
        alert('Error updating user: ' + data.message);
      }
    })
    .catch(error => console.error('Error updating user:', error));
});

function openDeleteModal(userId) {
  // Store userId for deletion
  document.getElementById('deleteModal').dataset.userId = userId;
  document.getElementById('deleteModal').style.display = 'block';
  document.getElementById('backdrop').style.display = 'block';
}

function closeDeleteModal() {
  document.getElementById('deleteModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

function confirmDelete() {
  const userId = document.getElementById('deleteModal').dataset.userId;
  fetch(`php/delete_user.php?id=${userId}`, {
    method: 'GET'
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        document.getElementById('deleteModal').style.display = 'none';
        setTimeout(() => {
          document.getElementById('successModal').style.display = 'block';
          setTimeout(() => {
            closeSuccessModal();
            // Reload the page and stay on the Users section
            window.location.href = window.location.pathname + '?section=user';
          }, 1000); // Delay before reloading the page
        }, 500); // Delay before showing success modal
      } else {
        alert('Error deleting user: ' + data.message);
      }
    })
    .catch(error => console.error('Error deleting user:', error));
}

function closeSuccessModal() {
  document.getElementById('successModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

function reloadUsersSection() {
  // Hide all sections
  document.querySelectorAll('.content-section').forEach(section => section.style.display = 'none');

  // Show the Users section
  document.getElementById('user').style.display = 'block';

  // Update sidebar highlighting
  document.querySelectorAll('.sidebar-nav-link').forEach(link => link.classList.remove('active'));
  document.querySelector('.sidebar-nav-link[data-content="user"]').classList.add('active');
}

function previewProfilePicture(event) {
  const reader = new FileReader();
  reader.onload = function() {
    const output = document.getElementById('profilePicturePreview');
    output.src = reader.result;
  };
  reader.readAsDataURL(event.target.files[0]);
}

// JavaScript for Add User Modal
function openAddUserModal() {
  document.getElementById('addUserModal').style.display = 'block';
  document.getElementById('backdrop').style.display = 'block';
}

function closeAddUserModal() {
  document.getElementById('addUserModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

document.getElementById('addUserForm').addEventListener('submit', function(event) {
  event.preventDefault();
  const formData = new FormData(this);
  fetch('php/add_user.php', {
    method: 'POST',
    body: formData
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('User added successfully');
        closeAddUserModal();
        reloadUsersSection(); // Reload the Users section
      } else {
        alert('Error adding user: ' + data.message);
      }
    })
    .catch(error => console.error('Error adding user:', error));
});

function previewAddProfilePicture(event) {
  const reader = new FileReader();
  reader.onload = function() {
    const output = document.getElementById('addProfilePicturePreview');
    output.src = reader.result;
  };
  reader.readAsDataURL(event.target.files[0]);
}

// JavaScript for Search and Filter Users
function searchUsers() {
  const input = document.getElementById('searchInput');
  const filter = input.value.toLowerCase();
  const filterDropdown = document.getElementById('filterDropdown').value.toLowerCase();
  const table = document.getElementById('userTable');
  const tr = table.getElementsByTagName('tr');

  for (let i = 1; i < tr.length; i++) {
    const td = tr[i].getElementsByTagName('td');
    let showRow = false;

    for (let j = 0; j < td.length; j++) {
      if (td[j]) {
        const txtValue = td[j].textContent || td[j].innerText;
        if (txtValue.toLowerCase().indexOf(filter) > -1) {
          showRow = true;
          break;
        }
      }
    }

    const role = tr[i].querySelector('.user-subhead').textContent.toLowerCase();
    const status = tr[i].querySelector('.label').textContent.toLowerCase();

    if (filterDropdown && role !== filterDropdown && status !== filterDropdown) {
      showRow = false;
    }

    tr[i].style.display = showRow ? '' : 'none';
  }
}

function filterUsers() {
  searchUsers();
}


// Pagination

let currentPage = 1;
const usersPerPage = 10;
let filteredUsers = users; // Initialize filteredUsers with the full list of users

function displayUsers() {
  const userTableBody = document.getElementById('userTable').getElementsByTagName('tbody')[0];
  userTableBody.innerHTML = '';

  const startIndex = (currentPage - 1) * usersPerPage;
  const endIndex = Math.min(startIndex + usersPerPage, filteredUsers.length);

  for (let i = startIndex; i < endIndex; i++) {
    const user = filteredUsers[i];
    const statusClass = user.status === 'active' ? 'label-success' : 'label-default';
    const statusText = user.status.charAt(0).toUpperCase() + user.status.slice(1);

    const row = `<tr>
      <td>${user.id}</td>
      <td>
        <div class='user-info'>
          <img src='uploads/${user.image}' class='avatar' alt='Avatar'>
          <div class='user-details'>
            <a href='#' class='user-link'>${user.first_name} ${user.last_name}</a>
            <span class='user-subhead'>${user.role}</span>
          </div>
        </div>
      </td>
      <td>${user.username}</td>
      <td>${user.email}</td>
      <td>${user.created_at}</td>
      <td class='text-center'><span class='label ${statusClass}'>${statusText}</span></td>
      <td style='width: 20%; text-align: center;'>
        <a href='#' class='btn btn-sm btn-info' title='Edit' data-toggle='tooltip' onclick='openEditModal(${user.id})'><i class='fas fa-edit'></i></a>
        <a href='#' class='btn btn-sm btn-danger' title='Delete' data-toggle='tooltip' onclick='openDeleteModal(${user.id})'><i class='fas fa-trash'></i></a>
      </td>
    </tr>`;
    userTableBody.innerHTML += row;
  }

  document.getElementById('userCountMessage').innerText = `Showing ${endIndex - startIndex} of ${filteredUsers.length} entries`;
  document.getElementById('pageInfo').innerText = `Page ${currentPage} of ${Math.ceil(filteredUsers.length / usersPerPage)}`;
}

function prevPage() {
  if (currentPage > 1) {
    currentPage--;
    displayUsers();
  }
}

function nextPage() {
  if (currentPage < Math.ceil(filteredUsers.length / usersPerPage)) {
    currentPage++;
    displayUsers();
  }
}

function searchUsers() {
  const input = document.getElementById('searchInput');
  const filter = input.value.toLowerCase();
  const filterDropdown = document.getElementById('filterDropdown').value.toLowerCase();

  filteredUsers = users.filter(user => {
    const role = user.role.toLowerCase();
    const status = user.status.toLowerCase();
    const matchesFilter = filterDropdown === '' || role === filterDropdown || status === filterDropdown;

    return matchesFilter && (
      user.id.toString().toLowerCase().includes(filter) ||
      user.first_name.toLowerCase().includes(filter) ||
      user.last_name.toLowerCase().includes(filter) ||
      user.username.toLowerCase().includes(filter) ||
      user.email.toLowerCase().includes(filter) ||
      user.created_at.toLowerCase().includes(filter) ||
      role.includes(filter) ||
      status.includes(filter)
    );
  });

  currentPage = 1; // Reset to the first page
  displayUsers();
}

function filterUsers() {
  searchUsers();
}

document.addEventListener('DOMContentLoaded', function() {
  displayUsers();
});

let currentActivityPage = 1;
const activitiesPerPage = 10;
let activityData = []; // This will hold the activity data

function openActivityModal() {
  fetch('php/get_activity.php')
    .then(response => response.json())
    .then(data => {
      activityData = data;
      displayActivities();
      document.getElementById('activityModal').style.display = 'block';
      document.getElementById('backdrop').style.display = 'block';
    })
    .catch(error => console.error('Error fetching activity data:', error));
}

function closeActivityModal() {
  document.getElementById('activityModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

function displayActivities() {
  const activityTableBody = document.getElementById('activityTable').getElementsByTagName('tbody')[0];
  activityTableBody.innerHTML = '';

  const startIndex = (currentActivityPage - 1) * activitiesPerPage;
  const endIndex = Math.min(startIndex + activitiesPerPage, activityData.length);

  for (let i = startIndex; i < endIndex; i++) {
    const activity = activityData[i];
    const row = `<tr>
      <td>${activity.name}</td>
      <td>${activity.activity_type}</td>
      <td>${activity.activity_time}</td>
    </tr>`;
    activityTableBody.innerHTML += row;
  }

  document.getElementById('activityCountMessage').innerText = `Showing ${endIndex - startIndex} of ${activityData.length} entries`;
  document.getElementById('activityPageInfo').innerText = `Page ${currentActivityPage} of ${Math.ceil(activityData.length / activitiesPerPage)}`;
}

function prevActivityPage() {
  if (currentActivityPage > 1) {
    currentActivityPage--;
    displayActivities();
  }
}

function nextActivityPage() {
  if (currentActivityPage < Math.ceil(activityData.length / activitiesPerPage)) {
    currentActivityPage++;
    displayActivities();
  }
}

document.addEventListener('DOMContentLoaded', function() {
  // Initialize the activity modal if needed
});


// start of inventory js


let currentInventoryPage = 1;
const inventoryPerPage = 10;
let filteredInventory = inventory; // Initialize filteredInventory with the full list of inventory

function displayInventory() {
  const inventoryTableBody = document.getElementById('inventoryTable').getElementsByTagName('tbody')[0];
  inventoryTableBody.innerHTML = '';

  const startIndex = (currentInventoryPage - 1) * inventoryPerPage;
  const endIndex = Math.min(startIndex + inventoryPerPage, filteredInventory.length);

  for (let i = startIndex; i < endIndex; i++) {
    const product = filteredInventory[i];
    const row = `<tr>
      <td>${product.id}</td>
      <td><img src='${product.image}' alt='${product.product_name}' class='product-image'></td>
      <td>${product.product_code}</td>
      <td>${product.product_name}</td>
      <td>${product.category_name}</td>
      <td>${product.stock}</td>
      <td>${product.price}</td>
      <td>${product.date_added}</td>
      <td>${product.updated_at}</td>
      <td style='width: 20%; text-align: center;'>
        <a href='#' class='btn btn-sm btn-info' title='Edit' data-toggle='tooltip' onclick='openEditProductModal(${product.id})'><i class='fas fa-edit'></i></a>
        <a href='#' class='btn btn-sm btn-danger' title='Delete' data-toggle='tooltip' onclick='openDeleteProductModal(${product.id})'><i class='fas fa-trash'></i></a>
      </td>
    </tr>`;
    inventoryTableBody.innerHTML += row;
  }

  document.getElementById('inventoryCountMessage').innerText = `Showing ${endIndex - startIndex} of ${filteredInventory.length} entries`;
  document.getElementById('inventoryPageInfo').innerText = `Page ${currentInventoryPage} of ${Math.ceil(filteredInventory.length / inventoryPerPage)}`;
}

function prevInventoryPage() {
  if (currentInventoryPage > 1) {
    currentInventoryPage--;
    displayInventory();
  }
}

function nextInventoryPage() {
  if (currentInventoryPage < Math.ceil(filteredInventory.length / inventoryPerPage)) {
    currentInventoryPage++;
    displayInventory();
  }
}

function searchInventory() {
  const input = document.getElementById('searchInventoryInput');
  const filter = input.value.toLowerCase();
  const filterDropdown = document.getElementById('filterCategoryDropdown').value.toLowerCase();

  filteredInventory = inventory.filter(product => {
    const category = product.category_name.toLowerCase();
    const matchesFilter = filterDropdown === '' || category === filterDropdown;

    return matchesFilter && (
      product.product_code.toLowerCase().includes(filter) ||
      product.product_name.toLowerCase().includes(filter) ||
      product.category_name.toLowerCase().includes(filter) ||
      product.stock.toString().toLowerCase().includes(filter) ||
      product.price.toString().toLowerCase().includes(filter) ||
      product.date_added.toLowerCase().includes(filter) ||
      product.updated_at.toLowerCase().includes(filter)
    );
  });

  currentInventoryPage = 1; // Reset to the first page
  displayInventory();
}

function filterInventory() {
  searchInventory();
}

document.addEventListener('DOMContentLoaded', function() {
  displayInventory();
});


// Category Management
function openCategoryModal() {
  document.getElementById('categoryModal').style.display = 'block';
  document.getElementById('backdrop').style.display = 'block';
}

function closeCategoryModal() {
  document.getElementById('categoryModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

function openEditCategoryModal(id, name) {
  document.getElementById('editCategoryId').value = id;
  document.getElementById('editCategoryName').value = name;
  document.getElementById('editCategoryModal').style.display = 'block';
  document.getElementById('miniModalOverlay').style.display = 'block';
}

function closeEditCategoryModal() {
  document.getElementById('editCategoryModal').style.display = 'none';
  document.getElementById('miniModalOverlay').style.display = 'none';
}

document.getElementById('addCategoryForm').addEventListener('submit', function(event) {
  event.preventDefault();
  const formData = new FormData(this);
  fetch('php/add_category.php', {
    method: 'POST',
    body: formData
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Category added successfully');
        location.reload(); // Reload the page to see the new category
      } else {
        alert('Error adding category: ' + data.message);
      }
    })
    .catch(error => console.error('Error adding category:', error));
});

document.getElementById('editCategoryForm').addEventListener('submit', function(event) {
  event.preventDefault();
  const formData = new FormData(this);
  fetch('php/edit_category.php', {
    method: 'POST',
    body: formData
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Category updated successfully');
        location.reload(); // Reload the page to see the changes
      } else {
        alert('Error updating category: ' + data.message);
      }
    })
    .catch(error => console.error('Error updating category:', error));
});

function deleteCategory(categoryId) {
  if (confirm('Are you sure you want to delete this category?')) {
    fetch(`php/delete_category.php?id=${categoryId}`, {
      method: 'GET'
    })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          alert('Category deleted successfully');
          location.reload(); // Reload the page to see the changes
        } else {
          alert('Error deleting category: ' + data.message);
        }
      })
      .catch(error => console.error('Error deleting category:', error));
  }
}

// Inventory Delete and Success Modals
function openDeleteProductModal(productId) {
  console.log('openDeleteProductModal called with productId:', productId); // Debugging line
  document.getElementById('inventoryDeleteModal').dataset.productId = productId;
  document.getElementById('inventoryDeleteModal').style.display = 'block';
  document.getElementById('backdrop').style.display = 'block';
}

function closeInventoryDeleteModal() {
  document.getElementById('inventoryDeleteModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}

function confirmInventoryDelete() {
  const productId = document.getElementById('inventoryDeleteModal').dataset.productId;
  fetch(`php/delete_product.php?id=${productId}`, {
    method: 'GET'
  })
    .then(response => response.json())
    .then(data => {
      console.log('Response from delete_product.php:', data); // Debugging line
      if (data.success) {
        document.getElementById('inventoryDeleteModal').style.display = 'none';
        setTimeout(() => {
          document.getElementById('inventorySuccessModal').style.display = 'block';
          setTimeout(() => {
            closeInventorySuccessModal();
            location.reload(); // Reload the page to see the changes
          }, 1000); // Delay before reloading the page
        }, 500); // Delay before showing success modal
      } else {
        alert('Error deleting product: ' + data.message);
      }
    })
    .catch(error => console.error('Error deleting product:', error));
}

function closeInventorySuccessModal() {
  document.getElementById('inventorySuccessModal').style.display = 'none';
  document.getElementById('backdrop').style.display = 'none';
}




// end of inventory js 