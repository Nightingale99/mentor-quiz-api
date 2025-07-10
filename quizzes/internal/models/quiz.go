package models

type QuizID string

func (id QuizID) String() string {
	return string(id)
}

type Quiz struct {
	ID   QuizID `validator:"nonzero"`
	Text string `validator:"nonzero"`
	AuthorID
}
