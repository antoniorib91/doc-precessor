class DocumentsController < ApplicationController

  def get_out_documents
    docs = FileReaderService.get_out_documents()
    render json: docs
  end

  def get_in_documents
    docs = FileReaderService.get_in_documents()
    render json: docs
  end

  def get_out_document
    doc = FileReaderService.get_out_document(params[:doc_name])
    render json: doc
  end

  def get_in_document
    doc = FileReaderService.get_in_document(params[:doc_name])
    render json: doc
  end
end
