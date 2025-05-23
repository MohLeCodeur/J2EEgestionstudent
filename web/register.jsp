<!DOCTYPE html>
<html>
<head>
  <title>Inscription Admin</title>
  <%@ include file="/WEB-INF/includes/style.jsp" %>
</head>
<body>
  <div class="split-screen">
    <!-- Partie gauche avec image -->
    <div class="left-panel">
      <div class="left-content">
        <h1 class="display-4 fw-bold mb-4">Gestion �tudiants</h1>
        <p class="lead">Syst�me de gestion des �tudiants de l'universit�</p>
        <div class="mt-5">
          <p><i class="fas fa-check-circle me-2"></i> Gestion simplifi�e</p>
          <p><i class="fas fa-check-circle me-2"></i> Interface intuitive</p>
          <p><i class="fas fa-check-circle me-2"></i> S�curis� et fiable</p>
        </div>
      </div>
    </div>
    
    <!-- Partie droite avec formulaire -->
    <div class="right-panel">
      <div class="register-card">
        <div class="card-header-custom">
          <h4><i class="fas fa-user-plus me-2"></i>Inscription</h4>
        </div>
        <div class="card-body p-4">
          <form action="register" method="post">
            <div class="mb-3">
              <label for="nom" class="form-label">Nom complet</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="nom" name="nom" required>
              </div>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                <input type="email" class="form-control" id="email" name="email" required>
              </div>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mot de passe</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" class="form-control" id="password" name="mot_de_passe" required>
              </div>
            </div>
            <button type="submit" class="btn btn-custom w-100">
              <i class="fas fa-user-plus me-2"></i>S'inscrire
            </button>
            <c:if test="${not empty error}">
              <div class="alert alert-danger mt-3">${error}</div>
            </c:if>
          </form>
          <div class="text-center mt-3">
            <p>D�j� inscrit ? <a href="login">Se connecter</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>