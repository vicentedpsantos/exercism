pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let mut minefield = Minefield::new(minefield);

    for i in 0..minefield.height {
        for j in 0..minefield.width {
            if minefield.mines[i][j] != '*' {
                let mine_count = minefield
                    .neighbors(i, j)
                    .into_iter()
                    .filter(|c| **c == '*')
                    .count() as u32;
                if mine_count != 0 {
                    minefield.mines[i][j] = std::char::from_digit(mine_count, 10).unwrap()
                }
            }
        }
    }

    minefield
        .mines
        .iter()
        .map(|cs| cs.into_iter().collect())
        .collect()
}

struct Minefield {
    mines: Vec<Vec<char>>,
    height: usize,
    width: usize,
}

impl Minefield {
    fn new(mines: &[&str]) -> Self {
        let mines: Vec<Vec<char>> = mines.iter().map(|mf| mf.chars().collect()).collect();

        let height = mines.len();
        let width = if height == 0 { 0 } else { mines[0].len() };

        Self {
            mines,
            height,
            width,
        }
    }

    fn neighbors(&self, i: usize, j: usize) -> Vec<&char> {
        let mut result = Vec::new();
        if i > 0 {
            result.push(&self.mines[i - 1][j]);
        }
        if i > 0 && j > 0 {
            result.push(&self.mines[i - 1][j - 1]);
        }
        if i > 0 && j < self.width - 1 {
            result.push(&self.mines[i - 1][j + 1]);
        }
        if j > 0 {
            result.push(&self.mines[i][j - 1]);
        }
        if j < self.width - 1 {
            result.push(&self.mines[i][j + 1]);
        }
        if i < self.height - 1 {
            result.push(&self.mines[i + 1][j]);
        }
        if i < self.height - 1 && j > 0 {
            result.push(&self.mines[i + 1][j - 1]);
        }
        if i < self.height - 1 && j < self.width - 1 {
            result.push(&self.mines[i + 1][j + 1]);
        }

        result
    }
}
