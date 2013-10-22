from gaesessions import SessionMiddleware

def webapp_add_wsgi_middleware(app):
  app = SessionMiddleware(app, cookie_key="_K(|bE/n1*>%/-q%>G7>gcWHqF5W-(44")
  return app
