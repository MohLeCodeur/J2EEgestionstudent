<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Liste Étudiants</title>
 <%@ include file="/WEB-INF/includes/style.jsp" %>
</head>
<body>
  
 <%@ include file="/WEB-INF/includes/navbar.jsp" %>
  <div class="container">
    <div class="search-box mb-4 p-4 shadow-sm">
      <form method="get" action="StudentListServlet" class="row g-3">
        <div class="col-md-8">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-search"></i></span>
            <input type="text" class="form-control" name="search" value="${search}" 
                   placeholder="Rechercher par nom, prénom ou email">
          </div>
        </div>
        <div class="col-md-4">
          <button type="submit" class="btn btn-custom me-2">
            <i class="fas fa-search me-1"></i>Rechercher
          </button>
          <c:if test="${not empty search}">
            <a href="StudentListServlet" class="btn btn-outline-secondary">
              <i class="fas fa-times me-1"></i>Effacer
            </a>
          </c:if>
        </div>
      </form>
    </div>

    <div class="card shadow">
      <div class="card-header card-header-custom">
        <h4 class="mb-0">
          <i class="fas fa-users me-2"></i>
          <c:choose>
            <c:when test="${not empty search}">
              Résultats pour « ${search} » : ${count} étudiant(s)
            </c:when>
            <c:otherwise>
              Liste des étudiants (Total : ${count})
            </c:otherwise>
          </c:choose>
        </h4>
      </div>
      <div class="card-body">
        <div class="table-responsive">
         <table class="table table-striped table-hover">
  <thead class="table-custom">
    <tr>
      <th>ID</th>
      <th>Nom</th>
      <th>Prénom</th>
      <th>Email</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="s" items="${students}">
      <tr>
        <td>${s.id}</td>
        <td>${s.nom}</td>
        <td>${s.prenom}</td>
        <td>${s.email}</td>
        <td class="action-btns">
          <!-- Bouton Voir plus -->
          <button class="btn btn-sm btn-outline-info me-1" data-bs-toggle="modal" 
                  data-bs-target="#studentModal${s.id}">
            <i class="fas fa-eye"></i>
          </button>
          
          <!-- Bouton Éditer -->
          <a href="StudentFormServlet?action=edit&amp;id=${s.id}" class="btn btn-sm btn-outline-primary me-1">
            <i class="fas fa-edit"></i>
          </a>
          
          <!-- Bouton Supprimer -->
          <a href="StudentDeleteServlet?id=${s.id}" 
             onclick="return confirm('Supprimer cet étudiant ?')"
             class="btn btn-sm btn-outline-danger">
            <i class="fas fa-trash-alt"></i>
          </a>
          
          <!-- Modal pour les détails -->
          <div class="modal fade" id="studentModal${s.id}" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header card-header-custom">
                  <h5 class="modal-title">Détails de l'étudiant</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="row mb-3">
                    <div class="col-md-4 fw-bold">ID:</div>
                    <div class="col-md-8">${s.id}</div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-4 fw-bold">Nom:</div>
                    <div class="col-md-8">${s.nom}</div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-4 fw-bold">Prénom:</div>
                    <div class="col-md-8">${s.prenom}</div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-4 fw-bold">Email:</div>
                    <div class="col-md-8">${s.email}</div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-4 fw-bold">Adresse:</div>
                    <div class="col-md-8">${not empty s.adresse ? s.adresse : 'Non renseignée'}</div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-4 fw-bold">Date Naissance:</div>
                    <div class="col-md-8">
                      <c:if test="${not empty s.dateNaissance}">
                        <fmt:formatDate value="${s.dateNaissance}" pattern="dd/MM/yyyy" />
                      </c:if>
                      <c:if test="${empty s.dateNaissance}">
                        Non renseignée
                      </c:if>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-custom" data-bs-dismiss="modal">Fermer</button>
                </div>
              </div>
            </div>
          </div>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>