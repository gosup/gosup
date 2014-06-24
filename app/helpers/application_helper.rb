module ApplicationHelper

  def bootstrap_paperclip_picture(form, paperclip_object)
    if form.object.send("#{paperclip_object}?")
      content_tag(:div, class: 'control-group') do
        content_tag(:label, "Current #{paperclip_object.to_s.titleize}", class: 'control-label') + 
        content_tag(:div, class: 'controls') do
          image_tag form.object.send(paperclip_object).send(:url, :small)
        end
      end
    end
  end

  def status_document_link(status)
    if status.document && status.document.attachment?
      content_tag(:span, "Attachment", class: "label label-info") +
      link_to(status.document.attachment_file_name, status.document.attachment.url)
    end
  end

  def can_display_status?(status)
    signed_in? && !current_user.has_blocked?(status.user) || !signed_in? 
  end

  def avatar_profile_link(user, image_options={}, html_options={})
    avatar_url = user.avatar? ? user.avatar.url(:thumb) : "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8QEBEUEw0PEhQSERAZFBIQFBkSGRIWFBEXGyAVFBsZHCggHBolGxUUIT0iJikrLjouGh8/OD8tNyg5LysBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAE8ATwMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAAAgMGAQUHBP/EADIQAAEEAAIGBwgDAAAAAAAAAAEAAgMRBCEFBhMxUVISMkFhcoHRIiNCcZGSocEUorH/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8As9otJaLQPaLSWi0D2i1mKF7+qxzvCCViWJ7esxzfEKQFotJaLQPaLSWi0CWi0lotA5ct5oLRAkAkkHs/C3j3nuWgjb03sZzva36uAXRoIwAABQAoDuCAZEAKAAHALEsAcCCAQew5qdCCm6d0VsfbZfQJzHKfRai1f8ZAHsc07nAg+a51G45g7wSD5IJrRaS0WgjtFpLRaDH8jZyxPO5kkZPyDgT+F0+JwPauVYtttKsmpusjXBuHmeGyNyjc7ISDsF8wQXZCwFhxQQ4qVrGuc40GtJJ4AC1zDCyl1uPxEn6m1udctY2yXh4XB1n3r25gAHqA9p4rS4dtBB6LRaS0WgS0Wo7UuEgdLIyNu95r5cT5C0Hr0Zo2TEupuTR1nncPUq36M1dw0NERBzud46R8uHkvdo7BMhjaxoyH5PaT3r2AIABDgsoQV/SerGGlsiMRv5oxX3DcVUcdg3wP6Dx8iNzhxC6aQtbprRrZ4y0797XcrkHPLRaR4LXOa4UWkgjgQaWLQJas2ouFDnSSkbqa3zzP6VVccletSRWEaeZ8h/tX6QWVoTKDaI2iCdCg2iztEEyV4UW0QZEFF1zwuzxDXgZStz8Tcv8AKWjtWvX4e6idwlr7mn0VRBQf/9k="
    link_to(image_tag(avatar_url, image_options), profile_path(user.profile_name), html_options)
  end

  def page_header(&block)
    content_tag(:div, capture(&block), class: 'page-header')
  end

  def flash_class(type)
    case type 
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
end
