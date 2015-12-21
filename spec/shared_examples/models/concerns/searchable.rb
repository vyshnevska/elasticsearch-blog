RSpec.shared_examples 'a searchable' do

  let!(:article) { create described_class }

  def search attributes = {}
    Article.search(attributes)
  end

  before do
    Article.__elasticsearch__.create_index! index: Article.index_name
    Article.import
    sleep 1
  end

  after {  Article.__elasticsearch__.client.indices.delete index: Article.index_name }

  specify 'search by title' do
    # expect(search(q: 'some').records).to match [article]
  end
end
