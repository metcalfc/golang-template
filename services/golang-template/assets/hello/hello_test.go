package hello

import "testing"

func TestGreetsGitHub(t *testing.T) {
	result := Greet()
	if result != "Hello Docker and GitHub Actions." {
		t.Errorf("Greet() = %s; Unexpected output", result)
	}
}
