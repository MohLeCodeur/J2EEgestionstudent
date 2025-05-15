<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Détails Étudiant</title>
  <%@ include file="/WEB-INF/includes/style.jsp" %>
</head>
<body>
   <%@ include file="/WEB-INF/includes/navbar.jsp" %>

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card shadow">
          <div class="card-header card-header-custom">
            <h4 class="mb-0">
              <i class="fas fa-user-circle me-2"></i>Détails de l'étudiant
            </h4>
          </div>
          <div class="card-body">
            <div class="row g-3">
              <div class="col-md-6">
                <h5>ID</h5>
                <p class="text-muted">${student.id}</p>
              </div>
              <div class="col-md-6">
                <h5>Nom</h5>
                <p class="text-muted">${student.nom}</p>
              </div>
              <div class="col-md-6">
                <h5>Prénom</h5>
                <p class="text-muted">${student.prenom}</p>
              </div>
              <div class="col-md-6">
                <h5>Email</h5>
                <p class="text-muted">${student.email}</p>
              </div>
              <div class="col-12">
                <h5>Adresse</h5>
                <p class="text-muted">${student.adresse}</p>
              </div>
              <div class="col-md-6">
                <h5>Date de naissance</h5>
                <p class="text-muted">${student.dateNaissance}</p>
              </div>
            </div>
            <div class="mt-4">
              <a href="StudentFormServlet?action=edit&amp;id=${student.id}" 
                 class="btn btn-custom me-2">
                <i class="fas fa-edit me-1"></i>Modifier
              </a>
              <a href="students" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left me-1"></i>Retour
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>