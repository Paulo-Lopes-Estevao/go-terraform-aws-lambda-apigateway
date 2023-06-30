package main

import (
	"context"
	"encoding/json"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"log"
	"net/http"
)

type Africa struct {
	Flag        string   `json:"flag"`
	Location    string   `json:"location"`
	Keywords    []string `json:"keywords"`
	Name        string   `json:"name"`
	Capital     string   `json:"capital"`
	Currency    string   `json:"currency"`
	Language    string   `json:"language"`
	Population  float64  `json:"population"`
	Area        float64  `json:"area"`
	Callingcode string   `json:"callingcode"`
}

func HandleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (*events.APIGatewayV2HTTPResponse, error) {
	log.Println("Start handler")

	var africa []Africa
	err := json.Unmarshal(data, &africa)
	if err != nil {
		return errResponse(http.StatusInternalServerError, err.Error()), nil
	}

	return response(http.StatusOK, africa), nil
}

func response(code int, data []Africa) *events.APIGatewayV2HTTPResponse {

	marshalled, err := json.Marshal(data)
	if err != nil {
		return errResponse(http.StatusInternalServerError, err.Error())
	}

	return &events.APIGatewayV2HTTPResponse{
		StatusCode: code,
		Headers: map[string]string{
			"Content-Type": "application/json",
		},
		Body:            string(marshalled),
		IsBase64Encoded: false,
	}
}

func errResponse(status int, body string) *events.APIGatewayV2HTTPResponse {
	message := map[string]string{
		"message": body,
	}

	messageBytes, _ := json.Marshal(&message)

	return &events.APIGatewayV2HTTPResponse{
		StatusCode: status,
		Headers: map[string]string{
			"Content-Type": "application/json",
		},
		Body: string(messageBytes),
	}
}

func main() {
	log.Println("Start lambda")
	lambda.Start(HandleRequest)
}

var data = []byte(`
     [
      {
        "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/200px-Flag_of_South_Africa.svg.png",
        "location": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/LocationSouthAfrica.svg/300px-LocationSouthAfrica.svg.png",
        "keywords": ["ZA", "South Africa"],
        "name": "África do Sul",
        "capital": "Cape Town",
        "currency": "Rand",
        "language": "Inglês",
        "population": 0,
        "area": 0,
        "callingcode": "+27"
      },
      {
        "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Flag_of_Angola.svg/200px-Flag_of_Angola.svg.png",
        "location": "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/LocationAngola.svg/300px-LocationAngola.svg.png",
        "keywords": ["AO"],
        "name": "Angola",
        "capital": "Luanda",
        "currency": "Kwanza",
        "language": "Português",
        "population": 0,
        "area": 0,
        "callingcode": "+244"
      },
      {
        "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Algeria.svg/200px-Flag_of_Algeria.svg.png",
        "location": "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/LocationAlgeria.svg/300px-LocationAlgeria.svg.png",
        "keywords": ["DZ"],
        "name": "Argélia",
        "capital": "Algiers",
        "currency": "Dinar argelino",
        "language": "Árabe",
        "population": 0,
        "area": 0,
        "callingcode": "+213"
      }
	]`)
