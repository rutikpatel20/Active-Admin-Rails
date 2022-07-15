ActiveAdmin.register Note do
  permit_params :title, :body, :subject_id

  form title: "Notes Application in Rails" do |f|
    f.inputs "Note" do
      f.input :subject
      f.input :title, placeholder: "Enter Title Here"
      f.input :body, as: :quill_editor
    end
    f.actions
  end

  show title: "Your Note" do
    h1 link_to note.title, admin_notes_path
    h4 link_to note.subject.name, admin_subject_path(note.subject)
    div(class: 'note-body') do
      raw note.body
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :subject_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :subject_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
