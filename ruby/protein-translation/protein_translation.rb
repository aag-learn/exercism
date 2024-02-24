module Translation
  MAP = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  def self.of_rna(strand)
    results = []
    results if strand.size < 3

    last = strand.size - 1
    start_at = 0
    end_at = 2

    while end_at <= strand.size

      codon = strand[start_at..end_at]
      protein = MAP.fetch(codon) { |key| raise InvalidCodonError, "Unknown codon: #{key}" }
      break if protein == 'STOP'

      results.push(MAP[codon])

      remaining = last - end_at
      raise InvalidCodonError, 'Incomplete sequence' if remaining.positive? && remaining < 3

      start_at = end_at + 1
      end_at += 3
    end

    results
  end
end

class InvalidCodonError < StandardError
end
