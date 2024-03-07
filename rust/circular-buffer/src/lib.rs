pub struct CircularBuffer<T> {
    data: Vec<T>,
    size: usize,
}

impl<T> CircularBuffer<T> {
    // add code here
    pub fn new(size: usize) -> Self {
        CircularBuffer {
            data: Vec::new(),
            size,
        }
    }

    pub fn read(&self) -> Result<T, Error>
    where
        T: Copy,
    {
        if self.data.is_empty() {
            Err(Error::EmptyBuffer)
        } else {
            match self.data.last() {
                Some(v) => Ok(*v),
                None => Err(Error::EmptyBuffer),
            }
        }
    }

    pub fn write(&mut self, item: T) -> Result<(), Error> {
        self.data.push(item);
        Ok(())
    }

    pub fn clear(&mut self) {
        self.data = Vec::new();
    }

    pub fn overwrite(&mut self, item: T) -> Result<(), Error> {
        self.data.push(item);
        Ok(())
    }
}

impl<T> Default for CircularBuffer<T> {
    fn default() -> Self {
        CircularBuffer {
            data: Vec::new(),
            size: 5,
        }
    }
}

#[derive(Debug, PartialEq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}
