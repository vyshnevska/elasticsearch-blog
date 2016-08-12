RSpec.shared_examples 'a searchable' do

  let!(:article) { create described_class }

  before {  Article.reindex }

  specify('search by title'){ expect(search(q: 'some').records).to match [article] }

  private
    def search attributes = {}
      Article.search(attributes)
    end
end