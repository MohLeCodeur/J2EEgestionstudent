<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>
    <c:choose>
      <c:when test="${not empty student.id}">Modifier Étudiant</c:when>
      <c:otherwise>Ajouter Étudiant</c:otherwise>
    </c:choose>
  </title>
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
              <i class="fas fa-user-edit me-2"></i>
              <c:choose>
                <c:when test="${not empty student.id}">Modifier Étudiant</c:when>
                <c:otherwise>Ajouter Étudiant</c:otherwise>
              </c:choose>
            </h4>
          </div>
          <div class="card-body">
            <form action="saveStudent" method="post">
              <input type="hidden" name="id" value="${student.id}" />
              
              <div class="row g-3">
                <div class="col-md-6">
                  <label for="nom" class="form-label">Nom</label>
                  <input type="text" class="form-control" id="nom" name="nom" 
                         value="${student.nom}" required>
                </div>
                <div class="col-md-6">
                  <label for="prenom" class="form-label">Prénom</label>
                  <input type="text" class="form-control" id="prenom" name="prenom" 
                         value="${student.prenom}" required>
                </div>
                <div class="col-md-6">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="email" name="email" 
                         value="${student.email}" required>
                </div>
                <div class="col-md-6">
                  <label for="date_naissance" class="form-label">Date de naissance</label>
                  <input type="date" class="form-control" id="date_naissance" 
                         name="date_naissance" value="${student.dateNaissance}">
                </div>
                <div class="col-12">
                  <label for="adresse" class="form-label">Adresse</label>
                  <input type="text" class="form-control" id="adresse" name="adresse" 
                         value="${student.adresse}">
                </div>
                <div class="col-12 mt-4">
                  <button type="submit" class="btn btn-custom">
                    <i class="fas fa-save me-2"></i>Enregistrer
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>