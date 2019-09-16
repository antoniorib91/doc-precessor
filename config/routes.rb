Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'documents', to: 'sales#getDocs'
  get 'documents/out', to: 'documents#get_out_documents'
  get 'documents/in', to: 'documents#get_in_documents'
  get 'documents/out/:doc_name', to: 'documents#get_out_document'
  get 'documents/in/:doc_name', to: 'documents#get_in_document'
end
