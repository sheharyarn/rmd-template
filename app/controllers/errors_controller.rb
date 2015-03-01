class ErrorsController < ActionController::Base
  def not_found
    if env["REQUEST_PATH"] =~ /^\/api/
      render json: { error: 'not found' }, status: 404
    else
      render template: '../../public/404.html', layout: false, status: 404
    end
  end

  def exception
    if env["REQUEST_PATH"] =~ /^\/api/
      render json: { error: 'internal server error' }, status: 500
    else
      render template: '../../public/500.html', layout: false, status: 500
    end
  end
end