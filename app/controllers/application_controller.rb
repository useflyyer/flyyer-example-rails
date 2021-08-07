class ApplicationController < ActionController::Base
  before_action :set_flyyer

  def set_flyyer(&block)
    flyyer = Flyyer::Flyyer.create(&block)
    flyyer.project = 'your-project-identifier' # Get yours at: https://flyyer.io/dashboard/_/projects/_/integrate
    flyyer.path = request.path
    # Optional but recommended
    # flyyer.secret = 'your-secret-key' # Get yours at: https://www.flyyer.io/dashboard/_/projects/_/advanced
    # flyyer.strategy = 'JWT' # or 'HMAC'

    image_src = flyyer.href.html_safe

    social_image = {
      _: image_src,
    }
    # See 'meta-tags' documentation for more details: https://github.com/kpumuk/meta-tags
    set_meta_tags({
      site: 'Flyyer Rails Example',
      title: 'Learn how to integrate Flyyer with any Ruby on Rails app', # <title />
      description: 'What is really great about this tool is that is not invasive at all. It requires a simple integration and is quite flexible.', # <description />
      keywords: ['flyyer', 'rails', 'ruby', 'seo'],
      icon: '/favicon.png', type: 'image/png', # see /public directory

      image_src: image_src,
      og: {
        title: :title,
        description: :description,
        image: social_image,
      },
      twitter: {
        title: :title,
        description: :description,
        image: social_image,
        card: 'summary_large_image',
      },
      # Optional
      flyyer: {
        # Reference your previous or default image (eg: product item, profile image, etc.)
        default: '/default-social-image.png',
        # Additional variables
        color: 'indigo',
      },
    })
  end

  def root
    render '/index'
  end

  def about
    set_flyyer do |f|
      f.variables = { title: 'About' }
    end
    set_meta_tags title: 'About page', description: 'You can have pass variables to Flyyer.'
    render '/about'
  end
end
