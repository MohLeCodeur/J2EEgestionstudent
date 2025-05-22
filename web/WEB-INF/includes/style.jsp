<%@ page contentType="text/html;charset=UTF-8" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
  :root {
    --primary-color: #6a0dad;
    --secondary-color: #ff66b3;
    --light-color: #f8f1ff;
    --dark-color: #4b0082;
  }
  
  .split-screen {
    display: flex;
    min-height: 100vh;
  }
  
  .left-panel {
    flex: 1;
    background: url('https://videos.openai.com/vg-assets/assets%2Ftask_01jv0egtqdf85b07r36yahxkzp%2F1746993233_img_1.webp?st=2025-05-19T16%3A49%3A42Z&se=2025-05-25T17%3A49%3A42Z&sks=b&skt=2025-05-19T16%3A49%3A42Z&ske=2025-05-25T17%3A49%3A42Z&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skoid=aa5ddad1-c91a-4f0a-9aca-e20682cc8969&skv=2019-02-02&sv=2018-11-09&sr=b&sp=r&spr=https%2Chttp&sig=wK6o87ZgBNdEehj42EuN2ZgmUFTxLKJOnsXOyjljVKs%3D&az=oaivgprodscus') no-repeat center center;
    background-size: cover;
    position: relative;
  }
  
  .left-panel::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(106, 13, 173, 0.7);
  }
  
  .left-content {
    position: relative;
    z-index: 1;
    color: white;
    padding: 2rem;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  
  .right-panel {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    background-color: #f9f9f9;
  }
  
  .login-card, .register-card {
    width: 100%;
    max-width: 450px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    overflow: hidden;
  }
  
  .card-header-custom {
    background-color: var(--primary-color);
    color: white;
    text-align: center;
    padding: 1.5rem;
  }
  
  .btn-custom {
    background-color: var(--secondary-color);
    color: white;
    border: none;
  }
  
  .btn-custom:hover {
    background-color: #ff4da6;
    color: white;
  }
  
  .form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.25rem rgba(106, 13, 173, 0.25);
  }
  
  @media (max-width: 768px) {
    .split-screen {
      flex-direction: column;
    }
    
    .left-panel {
      min-height: 200px;
    }
  }
   body {
      background-color: #f9f9f9;
    }
    .navbar-custom {
      background-color: var(--primary-color);
    }
    .btn-custom {
      background-color: var(--secondary-color);
      color: white;
    }
    .btn-custom:hover {
      background-color: #ff4da6;
      color: white;
    }
    .card-header-custom {
      background-color: var(--primary-color);
      color: white;
    }
    .table-custom th {
      background-color: var(--primary-color);
      color: white;
    }
    .search-box {
      background-color: var(--light-color);
      border-radius: 10px;
      padding: 20px;
    }
    a {
      color: var(--primary-color);
    }
    a:hover {
      color: var(--dark-color);
    }
    .table-responsive {
      overflow-x: auto;
    }
    .action-btns {
      white-space: nowrap;
    }
</style>