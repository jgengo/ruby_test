describe ArabicToEnglish do
  before :each do 
    @arabic_to_english = ArabicToEnglish.new
  end

  describe '#new' do
    it 'doesn\'t take any param and it return a ArabicToEnglish object' do 
      expect(@arabic_to_english).to be_an_instance_of ArabicToEnglish
  end

  describe '#translate' do 

    # raised argument errors
    context 'argument validation'
      it 'raise an ArgumentError if it\'s not an Integer' do 
        expect { @arabic_to_english.translate('Japan') }.to raise_error(ArgumentError, 'Argument is not an Integer')
      end
      it 'raise an ArgumentError if it\'s not between 0 and 999999999999' do
        expect { @arabic_to_english.translate('-1') }.to raise_error(ArgumentError, 'Argument should be a value between 0 and 999999999999')
      end
      it 'raise an ArgumentError if it\'s not between 0 and 999999999999' do
        expect { @arabic_to_english.translate('1000000000000') }.to raise_error(ArgumentError, 'Argument should be a value between 0 and 999999999999')
      end
    end

  context 'argument translation number in English' do 
    # to
    it { expect(@arabic_to_english.translate('0')).to eq 'zero' }
    it { expect(@arabic_to_english.translate('1')).to eq 'one' }
    it { expect(@arabic_to_english.translate('8')).to eq 'eight' }
    it { expect(@arabic_to_english.translate('10')).to eq 'ten' }
    it { expect(@arabic_to_english.translate('11')).to eq 'eleven' }
    it { expect(@arabic_to_english.translate('12')).to eq 'twelve' }
    it { expect(@arabic_to_english.translate('13')).to eq 'thirteen' }
    it { expect(@arabic_to_english.translate('14')).to eq 'fourteen' }
    it { expect(@arabic_to_english.translate('15')).to eq 'fifteen' }
    it { expect(@arabic_to_english.translate('20')).to eq 'twenty' }
    it { expect(@arabic_to_english.translate('21')).to eq 'twenty one' }
    it { expect(@arabic_to_english.translate('42')).to eq 'forty two' }
    it { expect(@arabic_to_english.translate('200')).to eq 'two hundred' }
    it { expect(@arabic_to_english.translate('300')).to eq 'three hundred' }
    it { expect(@arabic_to_english.translate('371')).to eq 'three hundred seventy one' }
    it { expect(@arabic_to_english.translate('847')).to eq 'eight hundred forty seven' }
    it { expect(@arabic_to_english.translate('850')).to eq 'eight hundred fifty' }
    it { expect(@arabic_to_english.translate('901')).to eq 'nine hundred one' }
    it { expect(@arabic_to_english.translate('999')).to eq 'nine hundred ninety nine' }

    # more than thousand
    it { expect(@arabic_to_english.translate('1540')).to eq 'one thousand five hundred forty' }
    it { expect(@arabic_to_english.translate('4532')).to eq 'four thousand five hundred thirty two' }
    it { expect(@arabic_to_english.translate('4242')).to eq 'four thousand two hundred forty two' }
    it { expect(@arabic_to_english.translate('32323')).to eq 'thirty two thousand three hundred twenty three' }

    # more than millions
    it { expect(@arabic_to_english.translate('23230212')).to eq 'twenty three million two hundred thirty thousand two hundred twelve' }
    it { expect(@arabic_to_english.translate('135232876')).to eq 'one hundred thirty five million two hundred thirty two thousand eight hundred seventy six' }

    # more than billions
    it { expect(@arabic_to_english.translate('765623230212')).to eq 'seven hundred sixty five billion six hundred twenty three million two hundred thirty thousand two hundred twelve' }
    it { expect(@arabic_to_english.translate('23135232876')).to eq 'twenty three billion one hundred thirty five million two hundred thirty two thousand eight hundred seventy six' }

    # not_to
    random = Random.new
    50.times do
      num = random.rand(1...1000000000000)
      it { expect(@arabic_to_english.translate("#{num}")).not_to eq @arabic_to_english.translate("#{num+1}") }
    end
  end

  end
end