require 'matrix'
require 'mathn'

class Matrix
  def svd_decompose(dimensions = nil)
    column_heavy = row_count < column_count

    matrix = (column_heavy) ? self.transpose : self
    row_count = matrix.row_count
    column_count = matrix.column_count

    if dimensions
      raise 'Only dimensional reduction allowed' if dimensions > column_count
    end

    u, s, v = Sivade.decompose(matrix.rows.flatten(1), row_count, column_count)

    dimensions ||= column_count
    s = Matrix.diagonal(*s[0...dimensions])
    u = Matrix[*(u.each_slice(column_count).map { |row| row.take(dimensions) })]
    v = Matrix[*(v.each_slice(column_count).map { |row| row.take(dimensions) })]

    (column_heavy) ? [v, s, u] : [u, s, v]
  end

  def self.svd_recompose(u, s, v)
    u * s * v.transpose
  end

  def svd_reduce(dimensions)
    Matrix.svd_recompose(*svd_decompose(dimensions))
  end
end
