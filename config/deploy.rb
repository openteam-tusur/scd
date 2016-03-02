require 'openteam/capistrano/deploy'

set :bundle_binstubs, -> { shared_path.join('bin') }

set :linked_files, fetch(:linked_files) + %w[
  public/NASA-space-time-lapse-clips-HD.flv
  public/NASA-space-time-lapse-clips-HD.mp4
  public/NASA-space-time-lapse-clips-HD.ogv
  public/NASA-space-time-lapse-clips-HD.webm
]
