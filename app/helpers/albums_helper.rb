module AlbumsHelper
  def can_edit_album?(album)
    signed_in? && current_user == album.user
  end
  
  def album_thumbnail(album)
    if album.pictures.count > 0
      image_tag(album.pictures.first.asset.url(:small))
    else
      image_tag("http://placehold.it/240x180&text=Blank+Album!")
    end
  end
end
