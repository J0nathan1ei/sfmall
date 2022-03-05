package common

import (
	"testing"
)

// 测试日志初始化
func TestInitLogger(t *testing.T) {
	InitLogger()
	Logger.Info("test info")
	Logger.Warn("test warn")
	Logger.Error("test error")
}
